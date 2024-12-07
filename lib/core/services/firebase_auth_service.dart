import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../errors/exception.dart';
import '../helpers/logger.dart';

class FirebaseAuthService {
  static bool isLoggedIn = false;
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      logger.e(
          "Exception in [FirebaseAuthService.createUserWithEmailAndPassword]",
          error: e);

      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'هذا البريد الالكتروني مستخدم بالفعل');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: "لا يوجد اتصال بالانترنت");
      }
      throw CustomException(
          message: "لقد حدث خطأ غير معروف. الرجاء المحاولة مرة اخرى");
    } catch (e) {
      logger.e(
          "Exception in [FirebaseAuthService.createUserWithEmailAndPassword]",
          error: e);

      throw CustomException(
          message: "لقد حدث خطأ غير معروف. الرجاء المحاولة مرة اخرى");
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      logger.e("Exception in [FirebaseAuthService.signInWithEmailAndPassword]",
          error: e);
      if (e.code == 'user-not-found') {
        throw CustomException(message: "هذا البريد الالكتروني غير موجود");
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: "كلمة المرور غير صحيحة");
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: "لا يوجد اتصال بالانترنت");
      }

      throw CustomException(
          message: "لقد حدث خطأ غير معروف. الرجاء المحاولة مرة اخرى");
    } catch (e) {
      logger.e("Exception in [FirebaseAuthService.signInWithEmailAndPassword]",
          error: e);
      throw CustomException(
          message: "لقد حدث خطأ غير معروف. الرجاء المحاولة مرة اخرى");
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential.user!;
  }

  Future<User> signInWithFacebook() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
      nonce: nonce,
    );

    // Create a credential from the access token
    OAuthCredential facebookAuthCredential;

    loggerNoStack.i("tokenType${loginResult.accessToken!.type}");

    if (Platform.isIOS) {
      switch (loginResult.accessToken!.type) {
        case AccessTokenType.classic:
          final token = loginResult.accessToken as ClassicToken;
          facebookAuthCredential = FacebookAuthProvider.credential(
            token.authenticationToken!,
          );
          break;
        case AccessTokenType.limited:
          final token = loginResult.accessToken as LimitedToken;
          facebookAuthCredential = OAuthCredential(
            providerId: 'facebook.com',
            signInMethod: 'oauth',
            idToken: token.tokenString,
            rawNonce: rawNonce,
          );
          break;
      }
    } else {
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
    }

    // Once signed in, return the UserCredential
    final authCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    return authCredential.user!;
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);

    return userCredential.user!;
  }

  Future<void> deleteAccount() async {
    User user = FirebaseAuth.instance.currentUser!;
    await user.delete();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static void authStateChanges() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        isLoggedIn = true;
      } else {
        isLoggedIn = false;
      }
    });
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../errors/exception.dart';
import '../helpers/logger.dart';

class FirebaseAuthService {
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
}

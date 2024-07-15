import 'package:firebase_auth/firebase_auth.dart';

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
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exception.dart';
import 'package:e_commerce_app/features/auth/data/model/user_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthRepositoryImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      logger.e(
          "Exception in [AuthRepositoryImpl.createUserWithEmailAndPassword]",
          error: e);
      return left(const ServerFailure(
          "لقد حدث خطأ غير معروف. الرجاء المحاولة مرة اخرى"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      logger.e("Exception in [AuthRepositoryImpl.signInWithEmailAndPassword]",
          error: e);
      return left(const ServerFailure(
          "لقد حدث خطأ غير معروف. الرجاء المحاولة مرة اخرى"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      logger.e("Exception in [AuthRepositoryImpl.signInWithGoogle]", error: e);
      return left(const ServerFailure(
          "لقد حدث خطأ غير معروف. الرجاء المحاولة مرة اخرى"));
    }
  }
}

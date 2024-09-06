import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exception.dart';
import 'package:e_commerce_app/features/auth/data/model/user_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/services/data_service.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/utils/backend_endpoint.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepositoryImpl(
      {required this.firebaseAuthService, required this.databaseService});

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userEntity = UserModel(
        name: name,
        email: email,
        uId: user.uid,
      );

      await addUserData(user: userEntity);

      return right(userEntity);
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

      final userEntity = await getUserData(uid: user.uid);

      return right(userEntity);
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
      final userEntity = UserModel.fromFirebaseUser(user);

      final isUserExists = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExists, documentId: userEntity.uId);
      if (isUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      logger.e("Exception in [AuthRepositoryImpl.signInWithGoogle]", error: e);
      return left(const ServerFailure(
          "لقد حدث خطأ غير معروف. الرجاء المحاولة مرة اخرى"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    try {
      final user = await firebaseAuthService.signInWithFacebook();
      final userEntity = UserModel.fromFirebaseUser(user);

      final isUserExists = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExists, documentId: userEntity.uId);
      if (isUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      logger.e("Exception in [AuthRepositoryImpl.signInWithGoogle]", error: e);
      return left(const ServerFailure(
          "لقد حدث خطأ غير معروف. الرجاء المحاولة مرة اخرى"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithApple() async {
    try {
      final user = await firebaseAuthService.signInWithApple();
      final userEntity = UserModel.fromFirebaseUser(user);

      final isUserExists = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExists, documentId: userEntity.uId);
      if (isUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      logger.e("Exception in [AuthRepositoryImpl.signInWithGoogle]", error: e);
      return left(const ServerFailure(
          "لقد حدث خطأ غير معروف. الرجاء المحاولة مرة اخرى"));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    try {
      databaseService.addData(
        path: BackendEndpoint.addUserData,
        data: user.toMap(),
        documentId: user.uId,
      );
    } on Exception catch (_) {
      await firebaseAuthService.deleteAccount();
      rethrow;
    }
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    final userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      documentId: uid,
    );
    return UserModel.fromJson(userData);
  }
}

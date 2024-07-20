import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entites/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  );

  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<Either<Failures, UserEntity>> signInWithGoogle();

  Future<Either<Failures, UserEntity>> signInWithFacebook();
}

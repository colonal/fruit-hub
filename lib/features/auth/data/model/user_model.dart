import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.name, required super.uId});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? '',
      name: user.displayName ?? '',
      uId: user.uid,
    );
  }
}

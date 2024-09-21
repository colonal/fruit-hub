import 'dart:convert';

import 'package:e_commerce_app/features/auth/domain/entites/user_entity.dart';

import '../../constants.dart';
import '../../features/auth/data/model/user_model.dart';
import '../services/shared_preferences_singleton.dart';

UserEntity get getUser {
  var json = jsonDecode(SharedPreferencesSingleton.getString(kUserData));
  var user = UserModel.fromJson(json);
  return user;
}

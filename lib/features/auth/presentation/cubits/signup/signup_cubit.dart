import 'package:e_commerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/user_entity.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.repository) : super(SignupInitial());

  final AuthRepository repository;

  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());
    final result = await repository.createUserWithEmailAndPassword(
      name,
      email,
      password,
    );
    result.fold(
      (failure) => emit(SignupFailed(message: failure.message)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }
}

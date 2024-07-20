import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/user_entity.dart';
import '../../../domain/repository/auth_repository.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepository authRepository;
  SignInCubit(this.authRepository) : super(SignInInitial());

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final result = await authRepository.signInWithEmailAndPassword(
      email,
      password,
    );
    result.fold(
      (failure) => emit(SignInError(message: failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepository.signInWithGoogle();
    result.fold(
      (failure) => emit(SignInError(message: failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    final result = await authRepository.signInWithFacebook();
    result.fold(
      (failure) => emit(SignInError(message: failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }
}

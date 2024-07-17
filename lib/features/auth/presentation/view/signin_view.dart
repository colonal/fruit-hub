import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repository/auth_repository.dart';
import '../cubits/signin/signin_cubit.dart';
import 'widget/signin_view_body_bloc_consumer.dart';

class SignInView extends StatelessWidget {
  static const String routeName = '/login_view';
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepository>()),
      child: const SignInViewBodyBlocConsumer(),
    );
  }
}

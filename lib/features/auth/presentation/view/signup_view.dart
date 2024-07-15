import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../cubits/signup/signup_cubit.dart';
import 'widget/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = "/signup";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepository>()),
      child: const Scaffold(
        appBar: CustomAppBar(title: "حساب جديد"),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}

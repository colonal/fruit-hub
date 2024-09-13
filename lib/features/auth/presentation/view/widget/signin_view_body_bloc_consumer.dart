import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/build_error_bar.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../home/presentation/view/home_view.dart';
import '../../cubits/signin/signin_cubit.dart';
import 'signin_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.of(context).pushNamed(HomeView.routeName);
        } else if (state is SignInError) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading,
          child: const Scaffold(
            appBar: CustomAppBar(title: "تسجيل الدخول"),
            body: SignInViewBody(),
          ),
        );
      },
    );
  }
}

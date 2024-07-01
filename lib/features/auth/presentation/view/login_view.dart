import 'package:e_commerce_app/features/auth/presentation/view/widget/login_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class LoginView extends StatelessWidget {
  static const String routeName = '/login_view';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "تسجيل الدخول"),
      body: LoginViewBody(),
    );
  }
}

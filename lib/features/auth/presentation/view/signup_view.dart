import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widget/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = "/signup";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "حساب جديد"),
      body: SignupViewBody(),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../signup_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: "لا تملك حساب؟",
          style: TextStyles.semiBold16.copyWith(
            color: const Color(0xFF616A6B),
          ),
        ),
        const TextSpan(text: " "),
        TextSpan(
          text: "قم بإنشاء حساب",
          style: TextStyles.semiBold16.copyWith(
            color: AppColors.primaryColor,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.of(context).pushNamed(SignupView.routeName);
            },
        ),
      ]),
    );
  }
}

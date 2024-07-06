import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'have_an_account_widget.dart';
import 'terms_and_conditions_widget.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: 24),
          const CustomTextFormField(
            hintText: "الاسم بالكامل",
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          const CustomTextFormField(
              hintText: "البريد الإلكتروني",
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 16),
          const CustomTextFormField(
            hintText: "كلمة المرور",
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: Color(0xFFC9CECF),
            ),
          ),
          const SizedBox(height: 16),
          const TermsAndConditionsWidget(),
          const SizedBox(height: 30),
          CustomButton(text: "إنشاء حساب جديد", onPressed: () {}),
          const SizedBox(height: 26),
          const HaveAnAccountWidget(),
        ],
      ),
    );
  }
}

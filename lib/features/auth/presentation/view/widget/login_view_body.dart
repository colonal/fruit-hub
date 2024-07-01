import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/or_divider.dart';
import 'dont_have_an_account_widget.dart';
import 'social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: 24),
          const CustomTextFormField(
            hintText: "البريد الإلكتروني",
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          const CustomTextFormField(
            hintText: "كلمة المرور",
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: Color(0xFFC9CECF),
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              "نسيت كلمة المرور؟",
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
          ),
          const SizedBox(height: 33),
          CustomButton(text: "تسجيل دخول", onPressed: () {}),
          const SizedBox(height: 33),
          const DontHaveAnAccountWidget(),
          const SizedBox(height: 33),
          const OrDivider(),
          const SizedBox(height: 16),
          SocialLoginButton(
            image: Assets.imagesGoogleIcon,
            title: "تسجيل بواسطة جوجل",
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          SocialLoginButton(
            image: Assets.imagesAppleIcon,
            title: "تسجيل بواسطة أبل",
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          SocialLoginButton(
            image: Assets.imagesFacebookIcon,
            title: "تسجيل بواسطة فيسبوك",
            onPressed: () {},
          ),
          const SizedBox(height: 33),
        ],
      ),
    );
  }
}

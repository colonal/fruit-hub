import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/widgets/password_field.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/signin/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/or_divider.dart';
import 'dont_have_an_account_widget.dart';
import 'social_login_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: "البريد الإلكتروني",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onSaved: (text) {
                email = text!;
              },
            ),
            const SizedBox(height: 16),
            PasswordField(
              onSaved: (text) {
                password = text!;
              },
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
            CustomButton(
                text: "تسجيل دخول",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    context.read<SignInCubit>().signInWithEmailAndPassword(
                        email: email, password: password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                }),
            const SizedBox(height: 33),
            const DontHaveAnAccountWidget(),
            const SizedBox(height: 33),
            const OrDivider(),
            const SizedBox(height: 16),
            SocialLoginButton(
              image: Assets.imagesGoogleIcon,
              title: "تسجيل بواسطة جوجل",
              onPressed: () {
                context.read<SignInCubit>().signInWithGoogle();
              },
            ),
            const SizedBox(height: 16),
            SocialLoginButton(
              image: Assets.imagesAppleIcon,
              title: "تسجيل بواسطة أبل",
              onPressed: () {
                context.read<SignInCubit>().signInWithApple();
              },
            ),
            const SizedBox(height: 16),
            SocialLoginButton(
              image: Assets.imagesFacebookIcon,
              title: "تسجيل بواسطة فيسبوك",
              onPressed: () {
                context.read<SignInCubit>().signInWithFacebook();
              },
            ),
            const SizedBox(height: 33),
          ],
        ),
      ),
    );
  }
}

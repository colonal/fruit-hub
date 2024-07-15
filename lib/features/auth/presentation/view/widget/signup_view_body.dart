import 'package:e_commerce_app/core/widgets/build_error_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/password_field.dart';
import '../../cubits/signup/signup_cubit.dart';
import 'have_an_account_widget.dart';
import 'terms_and_conditions_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, name, password;
  bool isTermsAndConditions = false;

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
              hintText: "الاسم بالكامل",
              keyboardType: TextInputType.name,
              onSaved: (value) {
                name = value!;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: "البريد الإلكتروني",
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                email = value!;
              },
            ),
            const SizedBox(height: 16),
            PasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            const SizedBox(height: 16),
            TermsAndConditionsWidget(
              onChanged: (value) {
                isTermsAndConditions = value;
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
                text: "إنشاء حساب جديد",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (isTermsAndConditions) {
                      formKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                              name: name, email: email, password: password);
                    } else {
                      buildErrorBar(
                          context, "يجب عليك الموافقة على الشروط والاحكام");
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                }),
            const SizedBox(height: 26),
            const HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}

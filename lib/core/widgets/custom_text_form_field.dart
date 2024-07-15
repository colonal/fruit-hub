import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSaved;
  final bool obscureText;
  const CustomTextFormField(
      {required this.hintText,
      this.controller,
      this.suffixIcon,
      this.keyboardType,
      this.textInputAction,
      this.onSaved,
      this.obscureText = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(color: const Color(0xFF949D9E)),
        fillColor: const Color(0xFFF9FAFA),
        filled: true,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      smartDashesType: SmartDashesType.enabled,
      smartQuotesType: SmartQuotesType.enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      onSaved: onSaved,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xFFE6E9E9)),
    );
  }
}

import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  final void Function(String?)? onSaved;
  const PasswordField({this.onSaved, super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "كلمة المرور",
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: const Color(0xFFC9CECF),
        ),
      ),
      onSaved: widget.onSaved,
      obscureText: obscureText,
    );
  }
}

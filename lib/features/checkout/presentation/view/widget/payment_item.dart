import 'package:e_commerce_app/core/utils/app_decorations.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  final String title;
  final Widget child;
  const PaymentItem({required this.title, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title :",
          style: TextStyles.bold13,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          child: DecoratedBox(
            decoration: AppDecorations.greyBoxDecoration,
            child: child,
          ),
        )
      ],
    );
  }
}

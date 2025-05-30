import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class InActiveStepItem extends StatelessWidget {
  final String label;
  final int index;
  const InActiveStepItem({required this.label, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: const Color(0xFFF2F3F3),
          child: Text(
            '$index',
            style: TextStyles.semiBold13,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyles.semiBold16.copyWith(color: const Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}

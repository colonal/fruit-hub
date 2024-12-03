import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  const CustomErrorWidget({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyles.semiBold16,
      ),
    );
  }
}

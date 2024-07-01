import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onPressed;
  const SocialLoginButton(
      {required this.image,
      required this.title,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(image),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16.copyWith(
                color: const Color(0xFF0C0D0D),
              ),
            ),
            Visibility(
              visible: false,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: SvgPicture.asset(image),
            ),
          ],
        ),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFDDDFDF)),
          ),
        ),
      ),
    );
  }
}

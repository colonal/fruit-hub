import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'custom_check_box.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomCheckBox(
        isChecked: true,
        onChecked: (value) {},
      ),
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      horizontalTitleGap: 10,
      title: Text.rich(
        style: TextStyles.semiBold13,
        TextSpan(
          children: [
            TextSpan(
              text: "من خلال إنشاء حساب ، فإنك توافق على",
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF616A6B),
              ),
            ),
            const TextSpan(text: " "),
            TextSpan(
              text: "الشروط والأحكام الخاصة بنا",
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

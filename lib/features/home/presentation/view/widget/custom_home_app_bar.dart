import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        Assets.imagesProfileImage,
        width: 44,
        height: 44,
      ),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: const Color(0xFF949D9E)),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        style: TextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
      ),
      trailing: SizedBox(
        width: 34,
        height: 34,
        child: CircleAvatar(
          backgroundColor: const Color(0xFFEEF8ED),
          child: Center(
            child: SvgPicture.asset(
              Assets.imagesNotification,
              width: 20,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}

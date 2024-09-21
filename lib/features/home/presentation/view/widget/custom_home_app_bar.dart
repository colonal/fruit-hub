import 'package:flutter/material.dart';

import '../../../../../core/helpers/get_user.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/notification_widget.dart';

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
        getUser.name,
        style: TextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
      ),
      trailing: const NotificationWidget(),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/notification_widget.dart';
import 'widget/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  static const String routeName = '/best_selling_view';
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "الأكثر مبيعًا",
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: NotificationWidget(),
          ),
        ],
      ),
      body: BestSellingViewBody(),
    );
  }
}

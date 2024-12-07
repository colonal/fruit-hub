import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPadding),
                CustomAppBar(title: "السلة", showBackButton: false),
                SizedBox(height: 16),
                CartViewHeader(),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}

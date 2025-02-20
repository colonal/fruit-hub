import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'cart_items_list.dart';
import 'cart_view_header.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: kTopPadding),
                  CustomAppBar(title: "السلة", showBackButton: false),
                  SizedBox(height: 16),
                  CartViewHeader(),
                  SizedBox(height: 12),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: CartItemsList(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).size.height * .07,
          child: const CustomCartButton(),
        ),
      ],
    );
  }
}

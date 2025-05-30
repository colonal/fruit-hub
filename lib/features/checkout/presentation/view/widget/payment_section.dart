import 'package:flutter/material.dart';

import 'order_summary_widget.dart';
import 'shipping_address_widget.dart';

class PaymentSection extends StatelessWidget {
  final PageController pageController;

  const PaymentSection({required this.pageController, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const OrderSummaryWidget(),
        const SizedBox(height: 16),
        ShippingAddressWidget(
          pageController: pageController,
        ),
      ],
    );
  }
}

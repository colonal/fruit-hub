import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/order_entity.dart';
import 'shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    OrderEntity order = context.watch<OrderEntity>();
    return Column(
      children: [
        const SizedBox(height: 33),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price:
              (order.cart.calculateTotalPrice() + order.deliveryFee).toString(),
          isSelected: selectedIndex == 0,
          onTap: () {
            setState(() {
              selectedIndex = 0;
              order.payWithCash = true;
            });
          },
        ),
        const SizedBox(height: 16),
        ShippingItem(
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: order.cart.calculateTotalPrice().toString(),
          isSelected: selectedIndex == 1,
          onTap: () {
            setState(() {
              selectedIndex = 1;
              order.payWithCash = false;
            });
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

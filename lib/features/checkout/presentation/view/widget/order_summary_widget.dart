import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/order_entity.dart';
import 'payment_item.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    OrderInputEntity order = context.read<OrderInputEntity>();

    return PaymentItem(
      title: 'ملخص الطلب',
      child: Column(
        children: [
          ListTile(
            title: Text(
              "المجموع الفرعي :",
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF4E5556),
              ),
            ),
            trailing: Text(
              "${order.cart.calculateTotalPrice()} جنيه",
              style: TextStyles.semiBold16,
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            title: Text(
              "التوصيل  :",
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF4E5556),
              ),
            ),
            trailing: Text(
              "${order.deliveryFee} جنية",
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF4E5556),
              ),
            ),
          ),
          const SizedBox(height: 9),
          const Divider(
            thickness: .5,
            color: Color(0xFFCACECE),
          ),
          const SizedBox(height: 9),
          ListTile(
            title: const Text(
              "الكلي",
              style: TextStyles.bold16,
            ),
            trailing: Text(
              "${order.calculateTotalPrice()} جنية",
              style: TextStyles.bold16,
            ),
          ),
        ],
      ),
    );
  }
}

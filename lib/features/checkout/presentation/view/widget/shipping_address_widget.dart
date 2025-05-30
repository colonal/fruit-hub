import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'payment_item.dart';

class ShippingAddressWidget extends StatelessWidget {
  final PageController pageController;
  const ShippingAddressWidget({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.imagesLocation,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              ' ${context.read<OrderEntity>().shippingAddress}',
              textAlign: TextAlign.right,
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF4E5556),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 19),
                child: SizedBox(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.imagesEdit,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'تعديل',
                        style: TextStyles.semiBold13.copyWith(
                          color: const Color(0xFF949D9E),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

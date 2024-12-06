import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../entities/product_entities.dart';
import '../utils/app_text_styles.dart';
import 'custom_network_image.dart';

class FruitItem extends StatelessWidget {
  final ProductEntities product;
  const FruitItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF3F5F7),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 16, left: 0, right: 0),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomNetworkImage(image: product.imageUrl),
                  ),
                  PositionedDirectional(
                    top: 0,
                    start: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: Color(0xFF292D32),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            ListTile(
              title: Text(
                product.name,
                style: TextStyles.semiBold13,
              ),
              subtitle: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${product.price} دجنية",
                      style: TextStyles.bold13
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                    TextSpan(
                      text: " / ",
                      style: TextStyles.bold13
                          .copyWith(color: AppColors.lightSecondaryColor),
                    ),
                    TextSpan(
                      text: "كيلو",
                      style: TextStyles.semiBold13
                          .copyWith(color: AppColors.lightSecondaryColor),
                    ),
                  ],
                ),
                style: TextStyles.semiBold13,
              ),
              trailing: const CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

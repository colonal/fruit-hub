import 'package:e_commerce_app/core/entities/product_entities.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  final List<ProductEntities> products;
  const BestSellingGridView(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const FruitItem();
      },
    );
  }
}

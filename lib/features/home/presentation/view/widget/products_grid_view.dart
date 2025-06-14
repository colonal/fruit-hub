import 'package:e_commerce_app/core/entities/product_entities.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/fruit_item.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductEntities> products;
  const ProductsGridView(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return FruitItem(product: products[index]);
      },
    );
  }
}

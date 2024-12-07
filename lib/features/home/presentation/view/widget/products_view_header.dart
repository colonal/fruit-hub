import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProductsViewHeader extends StatelessWidget {
  final int productsCount;
  const ProductsViewHeader({required this.productsCount, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$productsCount نتائج", style: TextStyles.bold19),
        const Spacer(),
        DecoratedBox(
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0x66CACECE)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SvgPicture.asset(Assets.imagesFilter),
          ),
        ),
      ],
    );
  }
}

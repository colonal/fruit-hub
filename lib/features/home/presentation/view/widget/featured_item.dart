import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../../../core/utils/app_images.dart';
import 'featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: width,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              PositionedDirectional(
                end: 0,
                bottom: 0,
                start: width * .4,
                top: 0,
                child: Image.asset(
                  Assets.imagesFruitTest,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: width * .5,
                padding: const EdgeInsetsDirectional.only(start: 32),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: Svg(Assets.imagesFeaturedItemBackground),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      "عروض العيد",
                      style: TextStyles.regular13.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "خصم 25%",
                      style: TextStyles.bold19.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 11),
                    FeaturedItemButton(
                      onPressed: () {},
                    ),
                    const SizedBox(height: 29),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

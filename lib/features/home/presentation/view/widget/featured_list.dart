import 'package:flutter/material.dart';

import 'featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => const Padding(
            padding: EdgeInsetsDirectional.only(end: 8),
            child: FeaturedItem(),
          ),
        ),
      ),
    );
  }
}

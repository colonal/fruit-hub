import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../domain/entites/bottom_navigation_bar_entity.dart';

part 'active_item.dart';
part 'in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  final bool isSelected;
  final BottomNavigationBarEntity item;
  const NavigationBarItem(
      {required this.isSelected, required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: _ActiveItem(item: item),
      secondChild: _InActiveItem(item: item),
      crossFadeState:
          isSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 200),
    );
  }
}

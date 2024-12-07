import 'package:flutter/material.dart';

import '../cart_view.dart';
import '../products_view.dart';
import '../profile_view.dart';
import 'home_view.dart';

class MainViewBody extends StatelessWidget {
  final int currentViewIndex;
  const MainViewBody({required this.currentViewIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        ProductsView(),
        CartView(),
        ProfileView(),
      ],
    );
  }
}

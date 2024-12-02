import 'package:flutter/material.dart';

import 'widget/custom_bottom_navigation_bar.dart';
import 'widget/home_view.dart';

class MainView extends StatelessWidget {
  static const String routeName = '/home';
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: HomeView()),
    );
  }
}

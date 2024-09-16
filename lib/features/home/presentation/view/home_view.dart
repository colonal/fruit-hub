import 'package:flutter/material.dart';

import 'widget/custom_bottom_navigation_bar.dart';
import 'widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}

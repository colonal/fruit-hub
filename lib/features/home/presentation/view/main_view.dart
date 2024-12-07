import 'package:flutter/material.dart';

import 'widget/custom_bottom_navigation_bar.dart';
import 'widget/main_view_body_bloc_consumer.dart';

class MainView extends StatefulWidget {
  static const String routeName = '/home';
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          setState(() {
            currentViewIndex = index;
          });
        },
      ),
      body: SafeArea(
          child: MainViewBodyBlocConsumer(
        currentViewIndex: currentViewIndex,
      )),
    );
  }
}

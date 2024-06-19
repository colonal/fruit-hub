import 'package:flutter/material.dart';

import 'widget/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  static const String routeName = '/onBoarding';
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingViewBody(),
    );
  }
}

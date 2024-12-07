import 'package:flutter/material.dart';

import 'main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  final int currentViewIndex;
  const MainViewBodyBlocConsumer({required this.currentViewIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return MainViewBody(
      currentViewIndex: currentViewIndex,
    );
  }
}

import 'package:flutter/material.dart';

import 'active_step_item.dart';
import 'in_active_step_item.dart';

class StepItem extends StatelessWidget {
  final String label;
  final int index;
  final bool isActive;
  const StepItem(
      {required this.label,
      required this.index,
      this.isActive = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InActiveStepItem(index: index, label: label),
      secondChild: ActiveStepItem(label: label),
      crossFadeState:
          isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}

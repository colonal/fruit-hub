import 'package:flutter/material.dart';

import 'step_item.dart';

class CheckoutSteps extends StatelessWidget {
  final List<String> steps;
  final int currentStep;
  final ValueChanged<int>? onStepTapped;
  const CheckoutSteps(
      {required this.steps,
      required this.currentStep,
      this.onStepTapped,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        steps.length,
        (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                onStepTapped?.call(index);
              },
              child: StepItem(
                isActive: index <= currentStep,
                label: steps[index],
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}

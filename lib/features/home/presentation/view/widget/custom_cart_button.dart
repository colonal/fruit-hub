import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../cubit/cart/cart_cubit.dart';
import '../../cubit/cart_item/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          text:
              "الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه",
          onPressed: () {},
        );
      },
    );
  }
}

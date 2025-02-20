import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entites/cart_item_entity.dart';
import '../../cubit/cart_item/cart_item_cubit.dart';

class CartItemActionButtons extends StatelessWidget {
  final CartItemEntity cartItem;
  const CartItemActionButtons({required this.cartItem, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        return current is CartItemUpdated && cartItem == current.cartItem;
      },
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
              onPressed: () {
                cartItem.increaseQuantity();
                context.read<CartItemCubit>().updateCartItem(cartItem);
              },
              constraints: const BoxConstraints(maxHeight: 30, maxWidth: 30),
              padding: const EdgeInsets.all(3),
              iconSize: 20,
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(AppColors.primaryColor),
              ),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  Text(cartItem.quantity.toString(), style: TextStyles.bold13),
            ),
            IconButton(
              onPressed: () {
                cartItem.decreaseQuantity();
                context.read<CartItemCubit>().updateCartItem(cartItem);
              },
              constraints: const BoxConstraints(maxHeight: 30, maxWidth: 30),
              padding: const EdgeInsets.all(3),
              iconSize: 20,
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xFFF1F1F5)),
              ),
              icon: const Icon(
                Icons.remove,
                color: Color(0xFF979899),
              ),
            ),
          ],
        );
      },
    );
  }
}

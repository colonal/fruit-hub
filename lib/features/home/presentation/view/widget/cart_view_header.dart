import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cart/cart_cubit.dart';

class CartViewHeader extends StatelessWidget {
  const CartViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var cartItemsLength =
        context.watch<CartCubit>().cartEntity.cartItems.length;
    return ColoredBox(
      color: const Color(0xFFEBF9F1),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text("لديك $cartItemsLength منتجات في سله التسوق"),
          ),
        ),
      ),
    );
  }
}

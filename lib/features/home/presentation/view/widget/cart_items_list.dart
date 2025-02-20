import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cart/cart_cubit.dart';
import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    var cartItems = context.watch<CartCubit>().cartEntity.cartItems;
    return SliverList.separated(
      itemCount: cartItems.length,
      separatorBuilder: (context, index) =>
          Divider(color: Colors.grey.shade300),
      itemBuilder: (context, index) {
        return CartItem(
          cartItems[index],
        );
      },
    );
  }
}

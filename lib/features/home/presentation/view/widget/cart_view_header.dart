import 'package:flutter/material.dart';

class CartViewHeader extends StatelessWidget {
  const CartViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color(0xFFEBF9F1),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text("لديك 3 منتجات في سله التسوق"),
          ),
        ),
      ),
    );
  }
}

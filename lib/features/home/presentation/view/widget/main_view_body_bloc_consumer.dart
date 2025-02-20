import 'package:e_commerce_app/core/widgets/build_error_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cart/cart_cubit.dart';
import 'main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  final int currentViewIndex;
  const MainViewBodyBlocConsumer({required this.currentViewIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAddedState) {
          buildSuccessBar(context, 'تم اضافة المنتج بنجاح');
        } else if (state is CartItemRemovedState) {
          buildSuccessBar(context, 'تم حذف المنتج بنجاح');
        }
      },
      child: MainViewBody(
        currentViewIndex: currentViewIndex,
      ),
    );
  }
}

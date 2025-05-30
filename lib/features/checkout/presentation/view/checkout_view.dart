import 'package:e_commerce_app/core/helpers/get_user.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/home/domain/entites/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/repos/orders/orders_repos.dart';
import '../../../../core/services/get_it_service.dart';
import '../manger/add_order_cubit/add_order_cubit.dart';
import 'widget/add_order_cubit_bloc_builder.dart';
import 'widget/checkout_view_body.dart';

class CheckoutView extends StatefulWidget {
  static const routeName = '/checkout';

  final CartEntity cart;
  const CheckoutView({required this.cart, super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late final OrderEntity order;

  @override
  void initState() {
    order = OrderEntity(widget.cart, uId: getUser.uId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(ordersRepos: getIt<OrdersRepos>()),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'الشحن'),
        body: Provider.value(
          value: order,
          child: const AddOrderCubitBlocBuilder(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}

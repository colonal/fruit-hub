import 'package:e_commerce_app/core/cubits/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/repos/products/products_repo.dart';
import '../../../../core/services/get_it_service.dart';
import 'widget/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        productsRepo: getIt.get<ProductsRepo>(),
      )..getProducts(),
      child: const ProductsViewBody(),
    );
  }
}

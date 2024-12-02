import 'package:e_commerce_app/core/cubits/product/product_cubit.dart';
import 'package:e_commerce_app/core/repos/products/products_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/get_it_service.dart';
import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        productsRepo: getIt.get<ProductsRepo>(),
      )..getBestSellingProducts(),
      child: const HomeViewBody(),
    );
  }
}

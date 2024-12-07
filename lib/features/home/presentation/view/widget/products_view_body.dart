import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/cubits/product/product_cubit.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'products_grid_view_bloc_builder.dart';
import 'products_view_header.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: kTopPadding),
                const CustomAppBar(title: "المنتجات", showBackButton: false),
                const SizedBox(height: 16),
                const SearchTextField(),
                const SizedBox(height: 12),
                ProductsViewHeader(
                  productsCount: context.read<ProductCubit>().productsCount,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const ProductsGridViewBlocBuilder(),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}

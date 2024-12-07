import 'package:e_commerce_app/core/cubits/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helpers/get_dummy_product.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'products_grid_view.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return ProductsGridView(state.products);
        } else if (state is ProductError) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              message: state.message,
            ),
          );
        }
        return Skeletonizer.sliver(
          enabled: true,
          child: ProductsGridView(getDummyProducts()),
        );
      },
    );
  }
}

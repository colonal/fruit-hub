import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/repos/products/products_repo.dart';
import 'package:meta/meta.dart';

import '../../entities/product_entities.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductsRepo productsRepo;
  ProductCubit({required this.productsRepo}) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());
    final result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) => emit(ProductSuccess(products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) => emit(ProductSuccess(products)),
    );
  }
}

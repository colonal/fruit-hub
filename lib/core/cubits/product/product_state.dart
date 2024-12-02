part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductEntities> products;

  ProductSuccess(this.products);
}

final class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}

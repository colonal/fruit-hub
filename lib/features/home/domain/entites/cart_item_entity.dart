import 'package:e_commerce_app/core/entities/product_entities.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntities product;
  int quantity;

  CartItemEntity({required this.product, this.quantity = 1});

  num get totalPrice => product.price * quantity;

  num get totalWeight => product.unitAmount * quantity;

  void increaseQuantity() => quantity++;

  void decreaseQuantity() {
    if (quantity > 1) quantity--;
  }

  @override
  List<Object?> get props => [product];
}

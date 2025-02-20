import 'package:e_commerce_app/core/entities/product_entities.dart';

import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> _cartItems;
  CartEntity(List<CartItemEntity> cartItems) : _cartItems = cartItems;

  List<CartItemEntity> get cartItems => [..._cartItems];

  void add(CartItemEntity item) => _cartItems.add(item);

  void remove(CartItemEntity item) => _cartItems.remove(item);

  void removeCartItems(CartItemEntity item) => _cartItems.remove(item);

  bool isExists(ProductEntities product) {
    for (var element in _cartItems) {
      if (element.product == product) return true;
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntities product) {
    for (var element in _cartItems) {
      if (element.product == product) return element;
    }
    return CartItemEntity(product: product, quantity: 1);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var element in _cartItems) {
      totalPrice += element.totalPrice;
    }
    return totalPrice;
  }
}

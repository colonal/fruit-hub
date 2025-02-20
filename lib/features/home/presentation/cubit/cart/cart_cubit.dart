import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/product_entities.dart';
import '../../../domain/entites/cart_entity.dart';
import '../../../domain/entites/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  CartEntity cartEntity = CartEntity([]);

  void addCartItem(ProductEntities product) {
    bool isProductExist = cartEntity.isExists(product);

    var carItem = cartEntity.getCartItem(product);

    if (isProductExist) {
      carItem.increaseQuantity();
    } else {
      cartEntity.add(carItem);
    }
    emit(CartItemAddedState());
  }

  void deleteCartItem(CartItemEntity item) {
    cartEntity.removeCartItems(item);
    emit(CartItemRemovedState());
  }
}

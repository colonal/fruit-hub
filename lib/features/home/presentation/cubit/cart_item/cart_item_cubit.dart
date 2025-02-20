import 'package:bloc/bloc.dart';

import '../../../domain/entites/cart_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntity item) => emit(CartItemUpdated(item));
}

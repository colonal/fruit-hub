import '../../../../../core/helpers/get_currency.dart';
import '../../../../home/domain/entites/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };

  factory ItemEntity.fromEntity(CartItemEntity itemEntity) {
    return ItemEntity(
      name: itemEntity.product.name,
      quantity: itemEntity.quantity,
      price: itemEntity.product.price.toStringAsFixed(2),
      currency: getCurrency(),
    );
  }
}

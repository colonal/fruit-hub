import '../../../home/domain/entites/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromEntity(
      {required CartItemEntity cartItemEntity}) {
    return OrderProductModel(
      name: cartItemEntity.product.name,
      code: cartItemEntity.product.code,
      imageUrl: cartItemEntity.product.imageUrl!,
      price: cartItemEntity.product.price.toDouble(),
      quantity: cartItemEntity.quantity,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}

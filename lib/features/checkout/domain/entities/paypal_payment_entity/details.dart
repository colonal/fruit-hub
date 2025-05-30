import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  String? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  factory DetailsEntity.fromEntity(OrderEntity entity) => DetailsEntity(
        subtotal: entity.cart.calculateTotalPrice().toStringAsFixed(2),
        shipping: entity.calculateShippingCost().toStringAsFixed(2),
        shippingDiscount: entity.calculateShippingDiscount().toStringAsFixed(2),
      );
}

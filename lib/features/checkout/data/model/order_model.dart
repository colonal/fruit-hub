import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

import 'order_product_model.dart';
import 'shipping_address_model.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderId;
  OrderModel(
      {required this.totalPrice,
      required this.uId,
      required this.orderId,
      required this.shippingAddressModel,
      required this.orderProducts,
      required this.paymentMethod});

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      orderId: const Uuid().v4(),
      totalPrice: orderEntity.cart.calculateTotalPrice(),
      uId: orderEntity.uId,
      shippingAddressModel:
          ShippingAddressModel.fromEntity(orderEntity.shippingAddress),
      orderProducts: orderEntity.cart.cartItems
          .map((e) => OrderProductModel.fromEntity(
                cartItemEntity: e,
              ))
          .toList(),
      paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'Paypal',
    );
  }
  toJson() => {
        'orderId': orderId,
        'totalPrice': totalPrice,
        'uId': uId,
        'status': 'pending',
        'date': DateTime.now().toString(),
        'shippingAddressModel': shippingAddressModel.toJson(),
        'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
        'paymentMethod': paymentMethod,
      };
}

// payment method
import '../../../home/domain/entites/cart_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final String uId;
  final CartEntity cart;
  bool? payWithCash;
  final ShippingAddressEntity shippingAddress;
  final int deliveryFee = 40;

  OrderEntity(this.cart,
      {required this.uId,
      this.payWithCash,
      ShippingAddressEntity? shippingAddress})
      : shippingAddress = shippingAddress ?? ShippingAddressEntity();

  double calculateTotalPrice() {
    return cart.calculateTotalPrice() + deliveryFee;
  }

  double calculateShippingCost() {
    if (payWithCash == true) {
      return 30;
    } else {
      return 0;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cart.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }
}

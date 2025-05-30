import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';

import '../../../../../core/helpers/get_currency.dart';
import 'details.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderEntity entity) {
    return Amount(
      total: entity
          .calculateTotalPriceAfterDiscountAndShipping()
          .toStringAsFixed(2),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(entity),
    );
  }

  toJson() => {
        'total': total,
        'currency': currency,
        'details': details!.toJson(),
      };
}

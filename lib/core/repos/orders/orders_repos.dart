import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';

import '../../errors/failures.dart';

abstract class OrdersRepos {
  Future<Either<Failures, void>> addOrders({required OrderEntity order});
}

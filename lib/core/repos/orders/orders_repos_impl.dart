import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/services/data_service.dart';
import 'package:e_commerce_app/features/checkout/data/model/order_model.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';

import '../../utils/backend_endpoint.dart';
import 'orders_repos.dart';

class OrdersReposImpl extends OrdersRepos {
  final DatabaseService databaseService;

  OrdersReposImpl({required this.databaseService});

  @override
  Future<Either<Failures, void>> addOrders(
      {required OrderInputEntity order}) async {
    try {
      final orderModel = OrderModel.fromEntity(order);
      await databaseService.addData(
        path: BackendEndpoint.addOrders,
        documentId: orderModel.orderId,
        data: orderModel.toJson(),
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}

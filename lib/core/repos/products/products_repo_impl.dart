import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/entities/product_entities.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/services/data_service.dart';

import '../../utils/backend_endpoint.dart';
import 'products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});

  @override
  Future<Either<Failures, List<ProductEntities>>>
      getBestSellingProducts() async {
    try {
      final response = await databaseService
          .getData(path: BackendEndpoint.getProducts, query: {
        'limit': 10,
        'orderBy': 'sellingCount',
        'desc': true,
      }) as List<Map<String, dynamic>>;

      List<ProductEntities> products =
          response.map((e) => ProductModel.fromJson(e).toEntities()).toList();

      return right(products);
    } catch (e) {
      return left(const ServerFailure(
          "لقد حدث خطأ غير معروف. الرجاء المحاولة مرة اخرى"));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntities>>> getProducts() async {
    try {
      final response = await databaseService.getData(
          path: BackendEndpoint.getProducts) as List<Map<String, dynamic>>;

      List<ProductEntities> products =
          response.map((e) => ProductModel.fromJson(e).toEntities()).toList();

      return right(products);
    } catch (e) {
      return left(const ServerFailure(
          "لقد حدث خطأ غير معروف. الرجاء المحاولة مرة اخرى"));
    }
  }
}

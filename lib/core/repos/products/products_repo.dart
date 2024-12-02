import 'package:dartz/dartz.dart';

import '../../entities/product_entities.dart';
import '../../errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failures, List<ProductEntities>>> getProducts();
  Future<Either<Failures, List<ProductEntities>>> getBestSellingProducts();
}

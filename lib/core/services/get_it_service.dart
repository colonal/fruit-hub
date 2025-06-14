import 'package:e_commerce_app/core/repos/orders/orders_repos.dart';
import 'package:e_commerce_app/core/repos/orders/orders_repos_impl.dart';
import 'package:e_commerce_app/core/repos/products/products_repo.dart';
import 'package:e_commerce_app/core/services/data_service.dart';
import 'package:e_commerce_app/core/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../repos/products/products_repo_impl.dart';
import 'fire_store_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<DatabaseService>(() => FireStoreService());

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepoImpl(
        databaseService: getIt<DatabaseService>(),
      ));

  getIt.registerLazySingleton<OrdersRepos>(() => OrdersReposImpl(
        databaseService: getIt<DatabaseService>(),
      ));
}

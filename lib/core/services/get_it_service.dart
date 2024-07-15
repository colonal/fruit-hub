import 'package:e_commerce_app/core/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
}

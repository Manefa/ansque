import 'package:ansque/src/datasource/repositories/auth_repository.dart';
import 'package:ansque/src/services/shared_prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void registerDependencies() {
  /// registering services
  locator
    ..registerLazySingleton<SharedPrefs>(() => SharedPrefs())
    ..registerLazySingleton(() => FirebaseAuth.instance);

  /// registering repositories
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository(authInstance: locator()));
}

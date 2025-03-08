import 'package:fit_lit/common/services/remote_config/remote_config_repository.dart';
import 'package:fit_lit/feature/auth/services/auth_repository.dart';
import 'package:fit_lit/feature/games/services/evaluation_repository.dart';
import 'package:fit_lit/feature/home/repository/home_repository.dart';
import 'package:fit_lit/feature/home/repository/profile_repository.dart';
import 'package:get_it/get_it.dart';

void initRepositoriesModule(GetIt locator) {
  locator.registerLazySingleton<RemoteConfigRepository>(
    () => RemoteConfigRepository(locator()),
  );
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepository(locator()),
  );
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepository(locator()),
  );
  locator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(locator()),
  );
  locator.registerLazySingleton<EvaluationRepository>(
    () => EvaluationRepository(locator()),
  );
}

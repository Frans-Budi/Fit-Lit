import 'package:fit_lit/common/services/remote_config/remote_config_data_source.dart';
import 'package:fit_lit/feature/auth/services/auth_data_source.dart';
import 'package:fit_lit/feature/games/services/evaluation_data_source.dart';
import 'package:fit_lit/feature/home/services/home_data_source.dart';
import 'package:fit_lit/feature/home/services/profile_data_source.dart';
import 'package:get_it/get_it.dart';

void initDataSourceModule(GetIt locator) {
  locator.registerLazySingleton<RemoteConfigDataSource>(
    () => RemoteConfigDataSource(),
  );
  locator.registerLazySingleton<AuthDataSource>(
    () => AuthDataSource(),
  );
  locator.registerLazySingleton<HomeDataSource>(
    () => HomeDataSource(),
  );
  locator.registerLazySingleton<ProfileDataSource>(
    () => ProfileDataSource(),
  );
  locator.registerLazySingleton<EvaluationDataSource>(
    () => EvaluationDataSource(),
  );
}

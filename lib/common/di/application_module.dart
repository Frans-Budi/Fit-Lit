import 'package:fit_lit/common/di/data_source_module.dart';
import 'package:fit_lit/common/di/repository_module.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> init() async {
  initDataSourceModule(locator);
  initRepositoriesModule(locator);
}

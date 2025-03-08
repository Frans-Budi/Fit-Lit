import 'package:firebase_core/firebase_core.dart';
import 'package:fit_lit/common/di/application_module.dart' as di;
import 'package:fit_lit/common/routes/app_pages.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/common/services/remote_config/remote_config_data_source.dart';
import 'package:fit_lit/common/theme/light_theme.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await RemoteConfigDataSource().initialize();
  await di.init();
  runApp(const ToastificationWrapper(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.TTL_FIT_LIT,
      theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: AppPages.routes,
    );
  }
}

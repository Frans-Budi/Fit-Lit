import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(AppConstants.SPLASH_DURATION);
    Get.offNamed(Routes.home);
  }
}

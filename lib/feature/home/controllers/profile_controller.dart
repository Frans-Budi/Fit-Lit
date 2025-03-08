import 'package:fit_lit/common/di/application_module.dart';
import 'package:fit_lit/common/helper/show_loading_dialog.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_method.dart';
import 'package:fit_lit/feature/auth/services/auth_repository.dart';
import 'package:fit_lit/feature/home/models/account.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final AuthRepository _authRepository = locator();
  final data = Get.arguments as Account;

  final account = Rxn<Account>();

  @override
  void onInit() {
    super.onInit();
    account.value = data;
  }

  void doLogout() async {
    AppMethod.showConfirmLogout(
      Get.context!,
      onLogout: () async {
        Get.back();
        showLoadingDialog(
            context: Get.context!, message: 'Sedang Keluar . . .');
        await _authRepository.logout();
        Get.offAllNamed(Routes.login);
      },
    );
  }

  void doEditProfile() async {
    final result = await Get.toNamed(Routes.editProfile, arguments: data);
    if (result != null) {
      account.value = result as Account;
    }
  }

  void onBackWithResult() => Get.back(result: account.value);

  void doAboutUs() => Get.toNamed(Routes.pdfView, arguments: {
        "title": AppConstants.TTL_ABOUT_US,
        "pdf_name": AppConstants.PDF_ABOUT_US,
      });
}

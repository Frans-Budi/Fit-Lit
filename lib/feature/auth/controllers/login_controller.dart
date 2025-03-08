import 'package:fit_lit/common/di/application_module.dart';
import 'package:fit_lit/common/helper/show_loading_dialog.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/common/utils/app_toast.dart';
import 'package:fit_lit/feature/auth/models/login_input_model.dart';
import 'package:fit_lit/feature/auth/services/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository = locator();

  final TextEditingController usernameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  RxBool isButtonEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    usernameC.addListener(_validateForm);
    passwordC.addListener(_validateForm);
  }

  void _validateForm() {
    isButtonEnabled.value =
        usernameC.text.isNotEmpty && passwordC.text.isNotEmpty;
  }

  void doLogin() async {
    showLoadingDialog(context: Get.context!, message: 'Verifikasi data . . .');
    final result = await _authRepository.login(
      LoginInputModel(
        username: usernameC.text.trim(),
        password: passwordC.text.trim(),
      ),
    );

    result.fold(
      (failure) {
        Get.back();
        AppToast.error(context: Get.context!, message: failure.message);
      },
      (user) {
        AppToast.success(context: Get.context!, message: 'Berhasil Login!');
        Get.offNamed(Routes.home);
      },
    );
  }
}

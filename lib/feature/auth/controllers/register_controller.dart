import 'package:fit_lit/common/di/application_module.dart';
import 'package:fit_lit/common/helper/show_loading_dialog.dart';
import 'package:fit_lit/common/helper/validators.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/common/utils/app_toast.dart';
import 'package:fit_lit/feature/auth/models/register_input_model.dart';
import 'package:fit_lit/feature/auth/services/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final AuthRepository _authRepository = locator();

  /// Text Editing Controllers
  final TextEditingController nameC = TextEditingController();
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController confirmPassC = TextEditingController();

  RxString nameInvalidMessage = "".obs;
  RxString usernameInvalidMessage = "".obs;
  RxString passwordInvalidMessage = "".obs;
  RxString confirmPassInvalidMessage = "".obs;
  RxBool isButtonEnabled = false.obs;

  final registerFormKey = GlobalKey<FormState>();

  /// Focus Nodes
  final FocusNode confirmPassFocus = FocusNode();

  @override
  void onInit() {
    super.onInit();
    nameC.addListener(_validateForm);
    usernameC.addListener(_validateForm);
    passwordC.addListener(_validateForm);
    confirmPassC.addListener(_validateForm);
  }

  String? validateFullName(String? val) {
    nameInvalidMessage.value = Validators.validateFullName(val) ?? "";
    return nameInvalidMessage.value.isEmpty ? null : "";
  }

  String? validateUsername(String? val) {
    usernameInvalidMessage.value = Validators.validateUsername(val) ?? "";
    return usernameInvalidMessage.value.isEmpty ? null : "";
  }

  String? validatePassword(String? val) {
    passwordInvalidMessage.value = Validators.validatePassword(val) ?? "";
    return passwordInvalidMessage.value.isEmpty ? null : "";
  }

  String? validateConfirmPass(String? val) {
    confirmPassInvalidMessage.value =
        Validators.validateConfirmPass(val, passwordC.text) ?? "";
    return confirmPassInvalidMessage.value.isEmpty ? null : "";
  }

  void _validateForm() {
    isButtonEnabled.value = nameC.text.isNotEmpty &&
        usernameC.text.isNotEmpty &&
        passwordC.text.isNotEmpty &&
        confirmPassC.text.isNotEmpty;
  }

  void doRegister() async {
    if (registerFormKey.currentState!.validate()) {
      showLoadingDialog(
          context: Get.context!, message: 'Verifikasi data . . .');
      final result = await _authRepository.register(
        RegisterInputModel(
            name: nameC.text.trim(),
            username: usernameC.text.trim(),
            password: passwordC.text.trim()),
      );

      result.fold(
        (failure) {
          Get.back();
          AppToast.error(context: Get.context!, message: failure.message);
        },
        (user) {
          AppToast.success(
              context: Get.context!, message: 'Berhasil Register!');
          Get.offNamed(Routes.home);
        },
      );
    }
  }

  @override
  void onClose() {
    nameC.dispose();
    usernameC.dispose();
    passwordC.dispose();
    confirmPassC.dispose();
    super.onClose();
  }
}

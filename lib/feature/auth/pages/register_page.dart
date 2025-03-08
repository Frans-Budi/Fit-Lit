import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/widgets/input/input_with_error.dart';
import 'package:fit_lit/common/widgets/input/text_input_basic.dart';
import 'package:fit_lit/common/widgets/input/text_input_password.dart';
import 'package:fit_lit/feature/auth/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  final controller = Get.put(RegisterController());
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            left: AppSizes.s32,
            right: AppSizes.s32,
            top: AppSizes.paddingTop,
          ),
          children: [
            AppSizes.s50.toVerticalSpace(),
            UnconstrainedBox(
              child: Assets.logo.fitlitHr.image(width: 200),
            ),
            AppSizes.s70.toVerticalSpace(),
            Form(
              key: controller.registerFormKey,
              child: Column(
                children: [
                  InputWithError(
                    message: controller.nameInvalidMessage,
                    child: TextInputBasic(
                      hintText: AppConstants.HINT_TEXT_FIELD_NAME,
                      controller: controller.nameC,
                      textInputAction: TextInputAction.next,
                      validator: controller.validateFullName,
                    ),
                  ),
                  AppSizes.s16.toVerticalSpace(),
                  InputWithError(
                    message: controller.usernameInvalidMessage,
                    child: TextInputBasic(
                      hintText: AppConstants.HINT_TEXT_FIELD_USERNAME,
                      textInputAction: TextInputAction.next,
                      controller: controller.usernameC,
                      validator: controller.validateUsername,
                    ),
                  ),
                  AppSizes.s16.toVerticalSpace(),
                  InputWithError(
                    message: controller.passwordInvalidMessage,
                    child: TextInputPassword(
                      hintText: AppConstants.HINT_TEXT_FIELD_PASSWORD,
                      textInputAction: TextInputAction.next,
                      controller: controller.passwordC,
                      validator: controller.validatePassword,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(controller.confirmPassFocus),
                    ),
                  ),
                  AppSizes.s16.toVerticalSpace(),
                  InputWithError(
                    message: controller.confirmPassInvalidMessage,
                    child: TextInputPassword(
                      hintText: AppConstants.HINT_TEXT_FIELD_CONFIRM_PASSWORD,
                      focusNode: controller.confirmPassFocus,
                      controller: controller.confirmPassC,
                      validator: controller.validateConfirmPass,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ],
              ),
            ),
            AppSizes.s75.toVerticalSpace(),
            Obx(
              () => ElevatedButton(
                onPressed: controller.isButtonEnabled.isTrue
                    ? () => controller.doRegister()
                    : null,
                child: const Text(AppConstants.ACT_REGISTER),
              ),
            ),
            AppSizes.s24.toVerticalSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppConstants.LBL_REDIRECT_TO_LOGIN,
                  style: TextStyle(color: AppColors.petrolBlueLight),
                ),
                TextButton(
                  onPressed: () => Get.offNamed(Routes.login),
                  child: const Text(AppConstants.ACT_LOGIN),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

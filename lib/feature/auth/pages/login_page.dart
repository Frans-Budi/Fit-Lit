import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/widgets/input/text_input_basic.dart';
import 'package:fit_lit/common/widgets/input/text_input_password.dart';
import 'package:fit_lit/feature/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final ctr = Get.put(LoginController());
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
          TextInputBasic(
            hintText: AppConstants.HINT_TEXT_FIELD_USERNAME,
            controller: ctr.usernameC,
          ),
          AppSizes.s18.toVerticalSpace(),
          TextInputPassword(
            hintText: AppConstants.HINT_TEXT_FIELD_PASSWORD,
            controller: ctr.passwordC,
          ),
          AppSizes.s75.toVerticalSpace(),
          Obx(
            () => ElevatedButton(
              onPressed: ctr.isButtonEnabled.isTrue ? ctr.doLogin : null,
              child: const Text(AppConstants.ACT_LOGIN),
            ),
          ),
          AppSizes.s24.toVerticalSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppConstants.LBL_REDIRECT_TO_REGISTER,
                style: TextStyle(color: AppColors.petrolBlueLight),
              ),
              TextButton(
                onPressed: () => Get.offNamed(Routes.register),
                child: const Text(AppConstants.ACT_REGISTER),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

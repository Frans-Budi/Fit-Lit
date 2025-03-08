import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLeadingGuest extends StatelessWidget {
  const HomeLeadingGuest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.s24,
        vertical: AppSizes.s8,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.s16,
        vertical: AppSizes.s12,
      ),
      decoration: BoxDecoration(
        color: AppColors.inputBlueBgColor,
        borderRadius: BorderRadius.circular(AppSizes.s12),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "Daftar sekarang, untuk mengakes fitur lainnya!",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.tealBlueLight,
              ),
            ),
          ),
          AppSizes.s12.toHorizontalSpace(),
          ElevatedButton(
            onPressed: () => Get.offNamed(Routes.register),
            child: const Text(AppConstants.ACT_REGISTER),
          ),
        ],
      ),
    );
  }
}

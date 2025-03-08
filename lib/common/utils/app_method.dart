import 'dart:io';

import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/common/widgets/button/row_button.dart';
import 'package:fit_lit/common/widgets/sturcture/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

class AppMethod {
  static void showConfirmPlayGameModal(
    BuildContext context, {
    required VoidCallback onNotSafe,
    required VoidCallback onSafe,
    Color? safeIconColor,
    Color? foregroundColor,
    Color? secondColor,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.6),
      builder: (context) {
        return CustomBottomSheet(
          icon: Assets.icons.icSafety.svg(
            width: AppSizes.s90,
            height: AppSizes.s90,
            colorFilter: safeIconColor != null
                ? ColorFilter.mode(safeIconColor, BlendMode.srcIn)
                : null,
          ),
          titleText: AppConstants.LBL_CONFIRM_SAFETY,
          titleColor: foregroundColor,
          actionYesColor: foregroundColor,
          actionNoColor: secondColor,
          content: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppConstants.CONFIRM_PLAY_DESC.length,
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.s5),
                    child: Icon(
                      Icons.circle,
                      color: foregroundColor ?? AppColors.petrolBlueLight,
                      size: 8,
                    ),
                  ),
                  AppSizes.s8.toHorizontalSpace(),
                  Expanded(
                    child: Text(
                      AppConstants.CONFIRM_PLAY_DESC[index],
                      style: TextStyles.subTitleCard(
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: foregroundColor,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          onYesAction: onSafe,
          onNoAction: onNotSafe,
        );
      },
    );
  }

  static void showConfirmFinishPlaying(
    BuildContext context, {
    required VoidCallback onNotFinish,
    required VoidCallback onFinish,
    Color? safeIconColor,
    Color? foregroundColor,
    Color? secondColor,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.6),
      builder: (context) {
        return CustomBottomSheet(
          icon: Assets.icons.icQuestion.svg(
            width: AppSizes.s65,
            height: AppSizes.s65,
            colorFilter: safeIconColor != null
                ? ColorFilter.mode(safeIconColor, BlendMode.srcIn)
                : null,
          ),
          titleText: AppConstants.LBL_CONFIRM_FINISH,
          actionNoText: AppConstants.ACT_BACK_TO_INSTRUCTION,
          actionYesText: AppConstants.ACT_YES_ALREADY_FINISH,
          titleColor: foregroundColor,
          actionYesColor: foregroundColor,
          actionNoColor: secondColor,
          onYesAction: onFinish,
          onNoAction: onNotFinish,
        );
      },
    );
  }

  static void showConfirmLogout(BuildContext context,
      {required VoidCallback onLogout}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0.6),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    AppConstants.LBL_CONFIRM_LOGOUT,
                    textAlign: TextAlign.center,
                    style: TextStyles.titleCard(fontSize: FontSize.s18),
                  ),
                  AppSizes.s20.toVerticalSpace(),
                  RowButton(
                    actionNoText: AppConstants.ACT_NO_LOGOUT,
                    actionYesText: AppConstants.ACT_YES_LOGOUT,
                    onNoAction: Get.back,
                    onYesAction: onLogout,
                  ),
                  AppSizes.paddingBottom.toVerticalSpace(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static void showUploadImageDialog({
    VoidCallback? selectImage,
    VoidCallback? takePicture,
  }) {
    Get.dialog(
      Padding(
        padding: EdgeInsets.all(AppSizes.s30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSizes.s10),
                ),
                child: Column(
                  children: [
                    // Select Image
                    ListTile(
                      onTap: selectImage,
                      contentPadding: EdgeInsets.only(
                        left: AppSizes.s30,
                        bottom: AppSizes.s4,
                        top: AppSizes.s4,
                      ),
                      horizontalTitleGap: AppSizes.s12,
                      leading: const Icon(Icons.image_outlined),
                      title: Text(
                        AppConstants.ACT_SELECT_ALBUM,
                        style: TextStyle(
                          color: AppColors.tealBlueLight,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ),
                    // Take Picture
                    ListTile(
                      onTap: takePicture,
                      contentPadding: EdgeInsets.only(
                        left: AppSizes.s30,
                        bottom: AppSizes.s4,
                      ),
                      horizontalTitleGap: AppSizes.s12,
                      leading: const Icon(Icons.camera_alt_outlined),
                      title: Text(
                        AppConstants.ACT_TAKE_PICTURE,
                        style: TextStyle(
                          color: AppColors.tealBlueLight,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<File?> selectImage() async {
    XFile? selectedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (selectedImage == null) return null;

    return File(selectedImage.path);
  }

  static Future<File?> takePicture() async {
    XFile? takePicture =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (takePicture == null) return null;

    return File(takePicture.path);
  }
}

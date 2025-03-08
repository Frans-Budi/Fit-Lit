import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/widgets/appbar/simple_app_bar.dart';
import 'package:fit_lit/common/widgets/image/circle_image.dart';
import 'package:fit_lit/common/widgets/input/input_with_error.dart';
import 'package:fit_lit/common/widgets/input/text_input_basic.dart';
import 'package:fit_lit/feature/home/controllers/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  final ctr = Get.put(EditProfileController());
  EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: const SimpleAppBar(),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppSizes.s24),
          children: [
            AppSizes.s16.toVerticalSpace(),
            Text(
              AppConstants.TTL_EDIT_PROFILE,
              style: TextStyle(
                fontSize: FontSize.s32,
                fontWeight: FontWeight.w700,
                color: AppColors.petrolBlueLight,
              ),
            ),
            AppSizes.s20.toVerticalSpace(),
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(AppSizes.s6),
                    child: CircleImage(
                      imageUrl: ctr.photoUrl.value,
                      fileImage: ctr.filePhoto.value,
                      width: AppSizes.s140,
                      height: AppSizes.s140,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton.filledTonal(
                      onPressed: ctr.doUploadPhoto,
                      style: IconButton.styleFrom(
                        side: const BorderSide(
                            width: 3,
                            color: Colors.white,
                            strokeAlign: BorderSide.strokeAlignOutside),
                      ),
                      icon: const Icon(Icons.edit_outlined),
                    ),
                  ),
                ],
              ),
            ),
            AppSizes.s40.toVerticalSpace(),
            Form(
              key: ctr.editProfileFormKey,
              child: Column(
                children: [
                  InputWithError(
                    message: ctr.nameInvalidMessage,
                    child: TextInputBasic(
                      hintText: AppConstants.HINT_TEXT_FIELD_NAME,
                      controller: ctr.nameC,
                      validator: ctr.validateFullName,
                    ),
                  ),
                  AppSizes.s16.toVerticalSpace(),
                  TextInputBasic(
                    hintText: AppConstants.HINT_TEXT_FIELD_USERNAME,
                    controller: ctr.usernameC,
                    readOnly: true,
                  ),
                ],
              ),
            ),
            AppSizes.s25.toVerticalSpace(),
            Obx(
              () => ElevatedButton(
                onPressed:
                    ctr.isButtonEnabled.isTrue ? ctr.doUpdateProfile : null,
                child: const Text(AppConstants.ACT_CHANGE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

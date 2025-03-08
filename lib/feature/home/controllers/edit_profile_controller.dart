import 'dart:io';

import 'package:fit_lit/common/di/application_module.dart';
import 'package:fit_lit/common/helper/show_loading_dialog.dart';
import 'package:fit_lit/common/helper/validators.dart';
import 'package:fit_lit/common/utils/app_method.dart';
import 'package:fit_lit/common/utils/app_toast.dart';
import 'package:fit_lit/feature/home/models/account.dart';
import 'package:fit_lit/feature/home/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final ProfileRepository _profileRepository = locator();
  final data = Get.arguments as Account;

  final TextEditingController nameC = TextEditingController();
  final TextEditingController usernameC = TextEditingController();

  RxString nameInvalidMessage = "".obs;
  final isButtonEnabled = RxBool(false);
  final photoUrl = RxnString();
  final filePhoto = Rxn<File>();

  final editProfileFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    _initializeData();
    nameC.addListener(_checkNameFormat);
  }

  void _initializeData() {
    nameC.text = data.name;
    usernameC.text = data.username;
    photoUrl.value = data.photo;
  }

  void _checkNameFormat() {
    if (nameC.text.isNotEmpty &&
        nameC.text.length >= 3 &&
        (nameC.text != data.name || filePhoto.value != null)) {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }
  }

  String? validateFullName(String? val) {
    nameInvalidMessage.value = Validators.validateFullName(val) ?? "";
    return nameInvalidMessage.value.isEmpty ? null : "";
  }

  void doUploadPhoto() {
    AppMethod.showUploadImageDialog(
      selectImage: () async {
        Get.back();
        showLoadingDialog(context: Get.context!, message: 'Loading . . .');
        File? selectImage = await AppMethod.selectImage();
        Get.back();
        if (selectImage != null) {
          filePhoto.value = selectImage;
          isButtonEnabled.value = true;
        }
      },
      takePicture: () async {
        Get.back();
        showLoadingDialog(context: Get.context!, message: 'Loading . . .');
        File? takePicture = await AppMethod.takePicture();
        Get.back();
        if (takePicture != null) {
          filePhoto.value = takePicture;
          isButtonEnabled.value = true;
        }
      },
    );
  }

  void doUpdateProfile() async {
    showLoadingDialog(context: Get.context!, message: 'Menyimpan data . . .');

    final String? imageUrl = filePhoto.value != null
        ? await _profileRepository.uploadImage(
            path: 'profile/${_profileRepository.currentUser!.uid}',
            file: filePhoto.value!,
          )
        : photoUrl.value;

    final result = await _profileRepository.updateProfile(
      name: nameC.text,
      imageUrl: imageUrl,
    );
    Get.back();
    if (result) {
      Get.back(
          result: Account(
        name: nameC.text,
        username: usernameC.text,
        photo: imageUrl,
      ));
      AppToast.success(
          context: Get.context!, message: 'Data profil berhasil diubah!');
    }
  }
}

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_lit/common/di/application_module.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/common/utils/app_toast.dart';
import 'package:fit_lit/common/utils/utility.dart';
import 'package:fit_lit/feature/auth/services/auth_repository.dart';
import 'package:fit_lit/feature/home/models/account.dart';
import 'package:fit_lit/feature/home/models/game_home_model.dart';
import 'package:fit_lit/feature/home/repository/home_repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthRepository _authRepository = locator();
  final HomeRepository _homeRepository = locator();

  final games = RxList<GameHomeModel>();
  final account = Rxn<Account>();
  final isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    loadGameHome();
    if (!checkGuest()) {
      loadProfileData();
    }
  }

  bool checkGuest() {
    User? user = _authRepository.currentUser;
    if (user == null) return true;
    return false;
  }

  void loadGameHome() async {
    final String jsonString = await rootBundle.loadString(Assets.json.gameHome);
    final List<Map<String, dynamic>> listData =
        List.from(jsonDecode(jsonString));
    for (var data in listData) {
      games.add(GameHomeModel.fromJson(data));
    }
  }

  void loadProfileData() async {
    isLoading.value = true;

    final result = await _homeRepository.getProfileData();
    cprint(result);
    result.fold(
      (failure) =>
          AppToast.error(context: Get.context!, message: failure.message),
      (data) {
        account.value = data;
      },
    );

    isLoading.value = false;
  }

  void goToProfile() async {
    final result = await Get.toNamed(Routes.profile, arguments: account.value);
    if (result != null) {
      account.value = result as Account;
    } else {
      loadProfileData();
    }
  }
}

import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_lit/common/di/application_module.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_method.dart';
import 'package:fit_lit/common/utils/app_toast.dart';
import 'package:fit_lit/common/utils/utility.dart';
import 'package:fit_lit/feature/auth/services/auth_repository.dart';
import 'package:fit_lit/feature/games/models/play_game_model.dart';
import 'package:fit_lit/feature/games/models/style_game_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlayingGameController extends GetxController {
  final AuthRepository _authRepository = locator();
  final data = Get.arguments['style'] as StyleGameModel;
  final isFinish = Get.arguments['isFinish'];

  final games = RxList<PlayGameModel>();
  final currentIndex = RxInt(0);
  final nextText = RxString(AppConstants.ACT_NEXT);
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  void onInit() async {
    super.onInit();
    cprint(isFinish);
    await loadGamesData(data.id);
  }

  Future<void> loadGamesData(String id) async {
    games.value = [];

    final String jsonString =
        await rootBundle.loadString(Assets.json.playingGames);
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    final List<Map<String, dynamic>> listData = List.from(jsonData[id]);
    for (var data in listData) {
      games.add(PlayGameModel.fromJson(data));
    }
  }

  void doNextButton() {
    if (currentIndex.value == games.length - 1) {
      if (checkGuest()) {
        Get.offAllNamed(Routes.register);
        return;
      } else if (isFinish) {
        Get.toNamed(Routes.evaluation,
            arguments: {'style': data, 'isFinish': isFinish});
        return;
      }
      AppMethod.showConfirmFinishPlaying(
        Get.context!,
        onNotFinish: Get.back,
        onFinish: () {
          Get.back();
          Get.toNamed(Routes.evaluation,
              arguments: {'style': data, 'isFinish': isFinish});
        },
        safeIconColor: data.safeIconColor,
        secondColor: data.secondColor,
        foregroundColor: data.foregroundColor,
      );
    } else if (currentIndex.value == games.length - 2) {
      carouselController.nextPage();
      if (checkGuest()) {
        AppToast.info(
            context: Get.context!,
            message: 'Daftarkan akun Kamu untuk mengakses fitur lainnya!');
      }
    } else {
      carouselController.nextPage();
    }
  }

  void doPreviousButton() {
    carouselController.previousPage();
  }

  void doPageChange(int index) {
    currentIndex.value = index;
    if (currentIndex.value == games.length - 1) {
      nextText.value = checkGuest()
          ? AppConstants.ACT_REGISTER
          : isFinish
              ? AppConstants.ACT_EDIT_EVALUATION
              : AppConstants.ACT_START_PLAY;
    } else {
      nextText.value = AppConstants.ACT_NEXT;
    }
  }

  bool checkGuest() {
    User? user = _authRepository.currentUser;
    if (user == null) return true;
    return false;
  }
}

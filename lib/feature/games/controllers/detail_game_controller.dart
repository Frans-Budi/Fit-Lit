import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_lit/common/di/application_module.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/helper/convert.dart';
import 'package:fit_lit/feature/auth/services/auth_repository.dart';
import 'package:fit_lit/feature/games/models/game_detail_model.dart';
import 'package:fit_lit/feature/games/models/game_part_model.dart';
import 'package:fit_lit/feature/games/services/evaluation_repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DetailGameController extends GetxController {
  final String gameId = Get.arguments['id'];
  final int percentArgument = Get.arguments['percent'];
  final EvaluationRepository _evaluationRepository = locator();
  final AuthRepository _authRepository = locator();

  final gameDetail = Rxn<GameDetailModel>();
  final percentage = RxInt(0);
  final isLoading = RxBool(false);

  @override
  void onInit() async {
    super.onInit();
    percentage.value = percentArgument;
    await loadDetailGame(gameId);
    if (!checkGuest()) loadEvaluation();
  }

  Future<void> loadDetailGame(String gameId) async {
    final String jsonString =
        await rootBundle.loadString(Assets.json.gameDetail);
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    final modelData = GameDetailModel.fromJson(jsonData[gameId]);
    gameDetail.value = modelData;
  }

  void loadEvaluation() async {
    isLoading.value = true;
    String? uid = _authRepository.currentUser?.uid;
    if (uid == null) return;

    final updatedGameParts = <GamePartModel>[];

    List<bool> listPercents = [];
    for (var data in gameDetail.value!.gameParts) {
      final result =
          await _evaluationRepository.getEvaluation("$uid|${data.id}");
      result.fold(
        (failure) {},
        (evaluation) {
          bool isFinished = evaluation != null;
          listPercents.add(isFinished);
          updatedGameParts.add(GamePartModel(
            id: data.id,
            title: data.title,
            subTitle: data.subTitle,
            imageName: data.imageName,
            subFolder: data.subFolder,
            pdfName: data.pdfName,
            isFinish: isFinished,
          ));
        },
      );
    }
    // Update the gameDetail with new gameParts list
    gameDetail.value = GameDetailModel(
      id: gameDetail.value!.id,
      title: gameDetail.value!.title,
      subTitle: gameDetail.value!.subTitle,
      backgroundColor: gameDetail.value!.backgroundColor,
      foregroundColor: gameDetail.value!.foregroundColor,
      safeIconColor: gameDetail.value!.safeIconColor,
      secondColor: gameDetail.value!.secondColor,
      gameParts: updatedGameParts,
    );
    percentage.value = Convert.listBoolToPercentage(listPercents);

    isLoading.value = false;
  }

  bool checkGuest() {
    User? user = _authRepository.currentUser;
    if (user == null) return true;
    return false;
  }
}

import 'dart:convert';

import 'package:fit_lit/common/di/application_module.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/helper/convert.dart';
import 'package:fit_lit/common/routes/app_routes.dart';
import 'package:fit_lit/feature/auth/services/auth_repository.dart';
import 'package:fit_lit/feature/games/models/game_category_model.dart';
import 'package:fit_lit/feature/games/models/game_detail_model.dart';
import 'package:fit_lit/feature/games/models/game_model.dart';
import 'package:fit_lit/feature/games/services/evaluation_repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  final String categoryId = Get.arguments;
  final EvaluationRepository _evaluationRepository = locator();
  final AuthRepository _authRepository = locator();

  final gameCategory = Rxn<GameCategoryModel>();
  final games = RxList<GameModel>();
  final isLoading = RxBool(true);

  @override
  void onInit() async {
    super.onInit();
    await loadGameCategoryData();
    await loadGamesData(gameCategory.value?.gameId ?? '');
    loadEvaluation();
  }

  Future<void> loadGameCategoryData() async {
    final String jsonString =
        await rootBundle.loadString(Assets.json.gameCategories);
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    final modelData = GameCategoryModel.fromJson(jsonData[categoryId]);
    gameCategory.value = modelData;
  }

  Future<void> loadGamesData(String categoryId) async {
    isLoading.value = true;
    games.value = [];

    final String jsonString = await rootBundle.loadString(Assets.json.games);
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    final List<Map<String, dynamic>> listData = List.from(jsonData[categoryId]);
    for (var data in listData) {
      games.add(GameModel.fromJson(data));
    }

    isLoading.value = false;
  }

  Future<GameDetailModel> loadDetailGame(String gameId) async {
    final String jsonString =
        await rootBundle.loadString(Assets.json.gameDetail);
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    final modelData = GameDetailModel.fromJson(jsonData[gameId]);
    return modelData;
  }

  void loadEvaluation() async {
    for (int i = 0; i < games.length; i++) {
      games[i] = games[i].copyWith(
        percent: await fetchPercantageByGameId(games[i].gameDetailId),
      );
    }
  }

  void goToDetail(GameModel game) async {
    final result = await Get.toNamed(
      Routes.detailGame,
      arguments: {
        'id': game.gameDetailId,
        'percent': game.percent,
      },
    );
    if (result != null) {
      int index = games.indexWhere((item) => item.id == game.id);
      if (index != -1) {
        final percent = await fetchPercantageByGameId(game.gameDetailId);
        games[index] = GameModel(
          id: game.id,
          title: game.title,
          backgroundColor: game.backgroundColor,
          foregroundColor: game.foregroundColor,
          imageName: game.imageName,
          subFolder: game.subFolder,
          gameDetailId: game.gameDetailId,
          percent: percent,
        );
      }
    }
  }

  Future<int> fetchPercantageByGameId(String gameDetailId) async {
    String? uid = _authRepository.currentUser?.uid;
    if (uid == null) return 0;

    List<bool> listPercents = [];
    final gameDetail = await loadDetailGame(gameDetailId);
    for (var game in gameDetail.gameParts) {
      final result =
          await _evaluationRepository.getEvaluation("$uid|${game.id}");

      result.fold(
        (failure) {},
        (evaluation) {
          bool isFinished = evaluation != null;
          listPercents.add(isFinished);
        },
      );
    }
    return Convert.listBoolToPercentage(listPercents);
  }
}

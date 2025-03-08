import 'package:fit_lit/common/utils/utility.dart';
import 'package:fit_lit/feature/games/models/game_part_model.dart';
import 'package:flutter/material.dart';

class GameDetailModel {
  final String id;
  final String title;
  final String subTitle;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color safeIconColor;
  final Color secondColor;
  final List<GamePartModel> gameParts;

  GameDetailModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.gameParts,
    required this.safeIconColor,
    required this.secondColor,
  });

  factory GameDetailModel.fromJson(Map<String, dynamic> json) =>
      GameDetailModel(
        id: json["id"],
        title: json["title"],
        subTitle: json["sub_title"],
        backgroundColor: hexToColor(json["background_color"]),
        foregroundColor: hexToColor(json["foreground_color"]),
        gameParts: List<GamePartModel>.from((json["game_parts"] as List)
            .map((item) => GamePartModel.fromJson(item))),
        safeIconColor: hexToColor(json["safe_icon_color"]),
        secondColor: hexToColor(json["second_color"]),
      );
}

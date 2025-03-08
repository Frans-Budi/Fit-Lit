import 'package:fit_lit/common/utils/utility.dart';
import 'package:flutter/material.dart';

class GameCategoryModel {
  final String id;
  final String title;
  final String subTitle;
  final Color backgroundColor;
  final Color foregroundColor;
  final String imageName;
  final String subFolder;
  final String gameId;

  GameCategoryModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.imageName,
    required this.subFolder,
    required this.gameId,
  });

  factory GameCategoryModel.fromJson(Map<String, dynamic> json) {
    return GameCategoryModel(
      id: json['id'],
      title: json['title'],
      subTitle: json['sub_title'],
      backgroundColor: hexToColor(json['background_color']),
      foregroundColor: hexToColor(json['foreground_color']),
      imageName: json['image_name'],
      subFolder: json['sub_folder'],
      gameId: json['game_id'],
    );
  }
}

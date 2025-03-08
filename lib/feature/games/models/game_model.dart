import 'package:fit_lit/common/utils/utility.dart';
import 'package:flutter/material.dart';

class GameModel {
  final String id;
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final String imageName;
  final String subFolder;
  final String gameDetailId;
  final int percent;

  GameModel({
    required this.id,
    required this.title,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.imageName,
    required this.subFolder,
    required this.gameDetailId,
    this.percent = 0,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'] as String,
      title: json['title'] as String,
      backgroundColor: hexToColor(json['background_color']),
      foregroundColor: hexToColor(json['foreground_color']),
      imageName: json['image_name'] as String,
      subFolder: json['sub_folder'] as String,
      gameDetailId: json['game_detail_id'] as String,
    );
  }

  GameModel copyWith({
    int? percent,
  }) {
    return GameModel(
      id: id,
      title: title,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      imageName: imageName,
      subFolder: subFolder,
      gameDetailId: gameDetailId,
      percent: percent ?? this.percent,
    );
  }
}

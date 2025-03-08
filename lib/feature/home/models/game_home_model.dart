import 'package:fit_lit/common/utils/utility.dart';
import 'package:flutter/material.dart';

import 'package:fit_lit/feature/home/models/size_position_model.dart';

class GameHomeModel {
  final String title;
  final String subTitle;
  final Color backgroundColor;
  final Color foregroundColor;
  final String imageName;
  final String subFolder;
  final SizePositionModel sizePosition;
  final String categoryId;

  GameHomeModel({
    required this.title,
    required this.subTitle,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.imageName,
    required this.subFolder,
    required this.sizePosition,
    required this.categoryId,
  });

  factory GameHomeModel.fromJson(Map<String, dynamic> json) {
    return GameHomeModel(
      title: json['title'] as String,
      subTitle: json['sub_title'] as String,
      backgroundColor: hexToColor(json['background_color']),
      foregroundColor: hexToColor(json['foreground_color']),
      imageName: json['image_name'] as String,
      subFolder: json['sub_folder'] as String,
      sizePosition: SizePositionModel.fromJson(
          json['size_position'] as Map<String, dynamic>),
      categoryId: json['category_id'] as String,
    );
  }
}

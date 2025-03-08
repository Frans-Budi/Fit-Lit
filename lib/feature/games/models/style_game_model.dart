import 'package:flutter/material.dart';

class StyleGameModel {
  final String id;
  final Color foregroundColor;
  final Color secondColor;
  final Color safeIconColor;

  StyleGameModel({
    required this.id,
    required this.foregroundColor,
    required this.secondColor,
    required this.safeIconColor,
  });

  factory StyleGameModel.fromJson(Map<String, dynamic> json) => StyleGameModel(
        id: json["id"],
        foregroundColor: json["foreground_color"],
        secondColor: json["second_color"],
        safeIconColor: json["safe_icon_color"],
      );
}

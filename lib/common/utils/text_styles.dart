import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle heading(
      {double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      double? height}) {
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.w800,
      fontSize: fontSize ?? FontSize.s20,
      color: color ?? AppColors.tealBlueLight,
      height: height,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle subHeading(
      {double? fontSize, Color? color, double? height}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: fontSize ?? FontSize.s12,
      color: color ?? AppColors.tealBlueLight,
      height: height,
    );
  }

  static TextStyle titleCard({double? fontSize, Color? color, double? height}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize ?? FontSize.s32,
      color: color ?? AppColors.tealBlueLight,
      height: height,
    );
  }

  static TextStyle subTitleCard(
      {double? fontSize,
      Color? color,
      double? height,
      FontWeight? fontWeight}) {
    return TextStyle(
      fontWeight: fontWeight ?? FontWeight.normal,
      fontSize: fontSize ?? FontSize.s12,
      color: color ?? AppColors.tealBlueLight,
      height: height,
    );
  }

  static TextStyle listTileText() {
    return TextStyle(
      fontSize: FontSize.s20,
      fontWeight: FontWeight.w600,
      color: AppColors.petrolBlueLight,
    );
  }

  static TextStyle titlePage({double? fontSize, Color? color, double? height}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize ?? FontSize.s32,
      color: color ?? AppColors.tealBlueLight,
      height: height,
    );
  }

  static TextStyle labelTextForm({
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: FontSize.s12,
      color: color ?? AppColors.tealBlueLight,
      height: height,
    );
  }
}

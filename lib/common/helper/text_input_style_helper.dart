import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextInputStyle {
  blue,
  red,
  green,
  yellow,
}

class TextInputStyleHelper {
  static Color getBackgroundColor(TextInputStyle style) {
    switch (style) {
      case TextInputStyle.blue:
        return AppColors.inputBlueBgColor;
      case TextInputStyle.red:
        return AppColors.inputRedBgColor;
      case TextInputStyle.green:
        return AppColors.inputGreenBgColor;
      case TextInputStyle.yellow:
        return AppColors.inputYellowBgColor;
    }
  }

  static Color getForegroundColor(TextInputStyle style) {
    switch (style) {
      case TextInputStyle.blue:
        return AppColors.petrolBlueLight;
      case TextInputStyle.red:
        return AppColors.redDeepLight;
      case TextInputStyle.green:
        return AppColors.greenDeepLight;
      case TextInputStyle.yellow:
        return AppColors.yellowDeepLight;
    }
  }

  static TextInputStyle getTextInputStyle(Color color) {
    if (color == AppColors.redDeepLight) {
      return TextInputStyle.red;
    } else if (color == AppColors.greenDeepLight) {
      return TextInputStyle.green;
    } else if (color == AppColors.yellowDeepLight) {
      return TextInputStyle.yellow;
    } else {
      return TextInputStyle.blue;
    }
  }
}

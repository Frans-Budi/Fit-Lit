import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppShadows {
  static List<BoxShadow> basicShadow = [
    const BoxShadow(
      color: AppColors.shadow,
      blurRadius: 10,
      spreadRadius: 2,
    )
  ];
}

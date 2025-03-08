import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.tealBlueLight,
        foregroundColor: AppColors.backgroundLight,
        textStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: FontSize.s16),
        disabledBackgroundColor: AppColors.steelGreyLight,
        disabledForegroundColor: AppColors.backgroundLight,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.petrolBlueLight,
        foregroundColor: Colors.white,
        iconSize: AppSizes.s28,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        enableFeedback: false,
        foregroundColor: AppColors.petrolBlueLight,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashFactory: NoSplash.splashFactory,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_shadows.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class AppToast {
  static void success({
    required BuildContext context,
    required String message,
  }) =>
      _showToast(
        context: context,
        type: ToastificationType.success,
        title: 'Berhasil',
        message: message,
      );

  static void error({
    required BuildContext context,
    required String message,
  }) =>
      _showToast(
        context: context,
        type: ToastificationType.error,
        title: 'Kesalahan',
        message: message,
      );

  static void info({
    required BuildContext context,
    required String message,
  }) =>
      _showToast(
        context: context,
        type: ToastificationType.info,
        title: 'Informasi',
        message: message,
      );

  static void _showToast({
    required BuildContext context,
    required ToastificationType type,
    required String title,
    required String message,
  }) {
    final Color foregroundColor = switch (type) {
      ToastificationType.info => AppColors.petrolBlueLight,
      ToastificationType.success => AppColors.greenLight,
      ToastificationType.warning => AppColors.yellowDeepLight,
      ToastificationType.error => AppColors.redLight,
    };
    final Color backgroundColor = switch (type) {
      ToastificationType.info => Colors.blue.shade50,
      ToastificationType.success => Colors.green.shade50,
      ToastificationType.warning => Colors.yellow.shade50,
      ToastificationType.error => Colors.red.shade50,
    };
    final IconData icon = switch (type) {
      ToastificationType.info => Icons.info_outline_rounded,
      ToastificationType.success => Icons.check_circle_outline,
      ToastificationType.warning => Icons.warning_amber_rounded,
      ToastificationType.error => Icons.error_outline_rounded,
    };

    toastification.show(
      context: context, // optional if you use ToastificationWrapper
      type: type,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 4),
      title: Text(
        title,
        style: TextStyle(
          fontSize: FontSize.s16,
          fontWeight: FontWeight.w600,
        ),
      ),
      description: Text(message),
      alignment: Alignment.topCenter,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      icon: Icon(icon, color: foregroundColor),
      showIcon: true, // show or hide the icon
      primaryColor: AppColors.tealBlueLight,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.s12,
        vertical: AppSizes.s16,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.s24,
        vertical: AppSizes.s8,
      ),
      borderRadius: BorderRadius.circular(12),
      boxShadow: AppShadows.basicShadow,
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.none,
      closeOnClick: false,
      pauseOnHover: false,
      dragToClose: true,
      applyBlurEffect: false,
      callbacks: ToastificationCallbacks(
        onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
        onCloseButtonTap: (toastItem) =>
            print('Toast ${toastItem.id} close button tapped'),
        onAutoCompleteCompleted: (toastItem) =>
            print('Toast ${toastItem.id} auto complete completed'),
        onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
      ),
    );
  }
}

import 'dart:io';

import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function()? onBack;

  const SimpleAppBar({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: AppSizes.s80,
      backgroundColor: backgroundColor,
      leading: IconButton.filled(
        onPressed: onBack ?? () => Get.back(),
        style: IconButton.styleFrom(backgroundColor: foregroundColor),
        icon: Platform.isAndroid
            ? const Icon(Icons.arrow_back)
            : const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

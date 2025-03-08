import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  const CustomBackButton({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () => Get.back(),
      style: IconButton.styleFrom(
        backgroundColor: color,
      ),
      icon: Platform.isAndroid
          ? const Icon(Icons.arrow_back)
          : const Icon(Icons.arrow_back_ios_new),
    );
  }
}

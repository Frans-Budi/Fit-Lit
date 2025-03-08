import 'package:fit_lit/common/controllers/splash_controller.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  final ctr = Get.put(SplashController());
  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.logo.fitlitHr.image(height: AppSizes.s50),
      ),
    );
  }
}

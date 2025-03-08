import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomNoImage extends StatelessWidget {
  final double? width;
  final double? height;

  const CustomNoImage({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Assets.images.noImage.image(
        width: width ?? AppSizes.s120,
        height: height ?? AppSizes.s120,
      ),
    );
  }
}

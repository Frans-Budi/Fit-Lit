import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CircleImageAsset extends StatelessWidget {
  final double? width;
  final double? height;

  const CircleImageAsset({
    super.key,
    this.width = 0,
    this.height = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width == 0) ? AppSizes.s65 : width,
      height: (height == 0) ? AppSizes.s65 : height,
      decoration: BoxDecoration(
        border: Border.all(
          width: 4,
          color: AppColors.cyanBlueLight,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(Assets.images.emptyPerson.path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

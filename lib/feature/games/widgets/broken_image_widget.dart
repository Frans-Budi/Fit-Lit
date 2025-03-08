import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class BrokenImageWidget extends StatelessWidget {
  const BrokenImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Assets.images.noImageRed.image(
        width: AppSizes.s60,
        height: AppSizes.s60,
      ),
    );
  }
}

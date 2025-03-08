import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/widgets/image/circle_image_asset.dart';
import 'package:fit_lit/common/widgets/skelton/skelton.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String? imageUrl;
  final File? fileImage;
  final double? width;
  final double? height;

  const CircleImage({
    super.key,
    this.imageUrl,
    this.fileImage,
    this.width = 0,
    this.height = 0,
  });

  @override
  Widget build(BuildContext context) {
    if (fileImage != null) {
      return Container(
        width: (width == 0) ? AppSizes.s65 : width,
        height: (height == 0) ? AppSizes.s65 : height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(fileImage!),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: AppColors.cyanBlueLight,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
      );
    }

    if (imageUrl == null || imageUrl == '') {
      return CircleImageAsset(
        width: width,
        height: height,
      );
    }
    return CachedNetworkImage(
      width: (width == 0) ? AppSizes.s65 : width,
      height: (height == 0) ? AppSizes.s65 : height,
      imageUrl: imageUrl ?? Assets.images.emptyPerson.path,
      imageBuilder: (context, imageProvider) => DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: AppColors.cyanBlueLight,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
      ),
      placeholder: (context, url) => Skelton(
        width: AppSizes.s65,
        height: AppSizes.s65,
        boxShape: BoxShape.circle,
      ),
      errorWidget: (context, url, error) => const CircleImageAsset(),
    );
  }
}

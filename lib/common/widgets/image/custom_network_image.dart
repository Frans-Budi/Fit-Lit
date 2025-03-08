import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final Color? loadingColor;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width = 0,
    this.height = 0,
    this.loadingColor,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: UniqueKey(),
      width: (width == 0) ? AppSizes.s100 : width,
      height: (height == 0) ? AppSizes.s100 : height,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider),
        ),
      ),
      placeholder: (context, url) => buildLoading(color: loadingColor),
      errorWidget: (context, url, error) {
        if (imageUrl.isEmpty) return buildLoading(color: loadingColor);
        return Assets.images.noImage.image(width: 50, height: 50);
      },
    );
  }

  Widget buildLoading({Color? color}) {
    return UnconstrainedBox(
      child: SizedBox(
        width: AppSizes.s40,
        height: AppSizes.s40,
        child: CircularProgressIndicator(
          color: color ?? AppColors.petrolBlueLight,
        ),
      ),
    );
  }
}

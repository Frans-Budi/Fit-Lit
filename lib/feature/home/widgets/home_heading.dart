import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/common/widgets/image/circle_image.dart';
import 'package:flutter/material.dart';

class HomeHeading extends StatelessWidget {
  final VoidCallback? onTap;
  final String name;
  final String? photoUrl;

  const HomeHeading({
    super.key,
    required this.name,
    this.photoUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.s24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyles.heading(fontWeight: FontWeight.normal),
                    text: AppConstants.LBL_GREEDING,
                    children: [
                      TextSpan(
                        text: name,
                        style: TextStyles.heading(),
                      ),
                    ],
                  ),
                ),
                AppSizes.s2.toVerticalSpace(),
                Text(
                  AppConstants.LBL_GREEDING_SUB,
                  style: TextStyles.subHeading(),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: CircleImage(imageUrl: photoUrl),
          ),
        ],
      ),
    );
  }
}

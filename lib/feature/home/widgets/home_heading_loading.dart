import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/common/widgets/skelton/skelton.dart';
import 'package:flutter/material.dart';

class HomeHeadingLoading extends StatelessWidget {
  const HomeHeadingLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.s24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    AppConstants.LBL_GREEDING,
                    style: TextStyles.heading(fontWeight: FontWeight.normal),
                  ),
                  Skelton(
                    width: AppSizes.s150,
                    height: AppSizes.s26,
                  ),
                ],
              ),
              AppSizes.s2.toVerticalSpace(),
              Text(
                AppConstants.LBL_GREEDING_SUB,
                style: TextStyles.subHeading(),
              ),
            ],
          ),
          Skelton(
            width: AppSizes.s70,
            height: AppSizes.s70,
            boxShape: BoxShape.circle,
          ),
        ],
      ),
    );
  }
}

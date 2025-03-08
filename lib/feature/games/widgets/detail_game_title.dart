import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/feature/games/models/game_detail_model.dart';
import 'package:flutter/material.dart';

class DetailGameTitle extends StatelessWidget {
  final GameDetailModel? data;
  final Color? textColor;

  const DetailGameTitle({
    super.key,
    required this.data,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.s24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data?.title ?? '',
            style: TextStyles.titleCard(color: textColor),
          ),
          AppSizes.s4.toVerticalSpace(),
          Text(
            data?.subTitle ?? '',
            style: TextStyles.subTitleCard(
                fontWeight: FontWeight.w500, color: textColor),
          ),
        ],
      ),
    );
  }
}

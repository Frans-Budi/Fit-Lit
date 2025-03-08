import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_shadows.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/feature/games/models/game_part_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DetailGameCard extends StatelessWidget {
  final VoidCallback? onPlay;
  final VoidCallback? onInfo;
  final GamePartModel gamePart;
  final Color? foregroundColor;
  final Color? secondColor;
  final bool isFinish;
  final bool isLoading;
  final Widget image;

  const DetailGameCard({
    super.key,
    this.onPlay,
    this.onInfo,
    required this.gamePart,
    this.foregroundColor,
    this.secondColor,
    this.isFinish = false,
    this.isLoading = false,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: AppSizes.s320,
          height: AppSizes.s400,
          padding: EdgeInsets.fromLTRB(
              AppSizes.s24, AppSizes.s24, AppSizes.s24, AppSizes.s55),
          decoration: BoxDecoration(
            color: isFinish ? Colors.grey.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(AppSizes.s30),
            boxShadow: AppShadows.basicShadow,
            border: isFinish
                ? Border.all(
                    color: secondColor ?? AppColors.petrolBlueLight,
                    width: 2,
                  )
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    image,
                    GestureDetector(
                      onTap: onInfo,
                      child: Assets.icons.icInfo.svg(
                        width: AppSizes.s32,
                        height: AppSizes.s32,
                        colorFilter: ColorFilter.mode(
                          foregroundColor ?? AppColors.petrolBlueLight,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                gamePart.title,
                style: TextStyles.titleCard(color: foregroundColor),
              ),
              Text(
                gamePart.subTitle,
                style: TextStyles.subTitleCard(
                  fontWeight: FontWeight.w500,
                  color: foregroundColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: AppSizes.s320,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: AppSizes.s200,
              height: AppSizes.s60,
              child: ElevatedButton(
                onPressed: isLoading ? () {} : onPlay,
                iconAlignment: IconAlignment.end,
                style: ElevatedButton.styleFrom(
                  backgroundColor: foregroundColor,
                ),
                child: isLoading
                    ? SpinKitThreeInOut(
                        size: AppSizes.s25,
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: index.isEven
                                  ? Colors.white
                                  : Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isFinish
                                ? AppConstants.ACT_REPEAT
                                : AppConstants.ACT_PLAY,
                            style: TextStyle(
                              fontSize: FontSize.s24,
                              height: 1,
                            ),
                          ),
                          AppSizes.s8.toHorizontalSpace(),
                          Assets.icons.icArrowRight.svg(
                            width: AppSizes.s32,
                            height: AppSizes.s32,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

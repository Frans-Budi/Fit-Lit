import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_shadows.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String subTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget image;

  const HomeCard({
    super.key,
    this.onTap,
    required this.title,
    required this.subTitle,
    this.backgroundColor,
    this.foregroundColor,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: AppSizes.s220,
          margin: EdgeInsets.symmetric(
            horizontal: AppSizes.s24,
            vertical: AppSizes.s25,
          ),
          padding: EdgeInsets.only(
            top: AppSizes.s24,
            right: AppSizes.s10,
            bottom: AppSizes.s10,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(AppSizes.s24)),
            boxShadow: AppShadows.basicShadow,
          ),
          child: Row(
            children: [
              SizedBox(width: AppSizes.s140),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.titleCard(
                          color: foregroundColor, height: 1.15),
                    ),
                    AppSizes.s4.toVerticalSpace(),
                    Text(
                      subTitle,
                      style: TextStyles.subTitleCard(color: foregroundColor),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton.filled(
                          onPressed: onTap,
                          style: IconButton.styleFrom(
                              backgroundColor: foregroundColor),
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        image,
      ],
    );
  }
}

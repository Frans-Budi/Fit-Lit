import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/common/widgets/button/custom_back_button.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget image;

  const CustomSliverAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const SizedBox(),
      expandedHeight: AppSizes.s230,
      pinned: true,
      foregroundColor: foregroundColor,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate expansion percentage
          final percent =
              (constraints.maxHeight - kToolbarHeight - AppSizes.paddingTop) /
                  (AppSizes.s230 - kToolbarHeight);
          return Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(percent * AppSizes.s24),
              ),
            ),
            child: FlexibleSpaceBar(
              expandedTitleScale: 1.4,
              title: UnconstrainedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.titleCard(
                          color: foregroundColor,
                          fontSize: FontSize.s26,
                          height: 1),
                    ),
                    AppSizes.s6.toVerticalSpace(),
                    percent > 0
                        ? Opacity(
                            opacity: percent,
                            child: SizedBox(
                              width: AppSizes.s130,
                              height: percent * AppSizes.s30,
                              child: Text(
                                subTitle,
                                style: TextStyles.subTitleCard(
                                  color: foregroundColor,
                                  fontSize: FontSize.s11,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              titlePadding: EdgeInsets.only(
                left: AppSizes.s24,
                bottom: (percent * AppSizes.s26) + AppSizes.s12,
              ),
              centerTitle: false,
              background: Stack(
                children: [
                  Positioned(
                    top: AppSizes.paddingTop + AppSizes.s12,
                    left: AppSizes.s24,
                    child: Opacity(
                      opacity: percent,
                      child: CustomBackButton(color: foregroundColor),
                    ),
                  ),
                  image
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

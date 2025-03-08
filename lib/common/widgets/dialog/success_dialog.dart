import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String text;
  final Color? iconColor;
  final Color? textColor;

  const SuccessDialog({
    super.key,
    required this.text,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Container(
        width: AppSizes.s280,
        padding: EdgeInsets.all(AppSizes.s40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.s30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.icons.icSuccess.svg(
              width: AppSizes.s80,
              height: AppSizes.s80,
              colorFilter: iconColor != null
                  ? ColorFilter.mode(
                      iconColor ?? AppColors.cyanBlueLight, BlendMode.srcIn)
                  : null,
            ),
            AppSizes.s20.toVerticalSpace(),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyles.titlePage(
                height: 1.3,
                fontSize: FontSize.s24,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

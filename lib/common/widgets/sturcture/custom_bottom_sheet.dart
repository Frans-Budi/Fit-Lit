import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/common/widgets/button/row_button.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget icon;
  final String titleText;
  final Widget? content;
  final String? actionNoText;
  final String? actionYesText;
  final VoidCallback? onNoAction;
  final VoidCallback? onYesAction;
  final Color? actionNoColor;
  final Color? actionYesColor;
  final Color? titleColor;

  const CustomBottomSheet({
    super.key,
    required this.icon,
    required this.titleText,
    this.content,
    this.actionNoText,
    this.actionYesText,
    this.onNoAction,
    this.onYesAction,
    this.actionNoColor,
    this.actionYesColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              AppSizes.s32, AppSizes.s32, AppSizes.s32, AppSizes.s60),
          child: Column(
            children: [
              icon,
              AppSizes.s16.toVerticalSpace(),
              Text(
                titleText,
                textAlign: TextAlign.center,
                style: TextStyles.titleCard(
                  fontSize: FontSize.s24,
                  height: 1.3,
                  color: titleColor,
                ),
              ),
              AppSizes.s24.toVerticalSpace(),
              content ?? const SizedBox(),
              AppSizes.s16.toVerticalSpace(),
              RowButton(
                onNoAction: onNoAction,
                actionNoColor: actionNoColor,
                actionNoText: actionNoText,
                onYesAction: onYesAction,
                actionYesColor: actionYesColor,
                actionYesText: actionYesText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

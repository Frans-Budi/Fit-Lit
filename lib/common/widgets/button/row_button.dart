import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class RowButton extends StatelessWidget {
  final VoidCallback? onNoAction;
  final VoidCallback? onYesAction;
  final Color? actionNoColor;
  final String? actionNoText;
  final Color? actionYesColor;
  final String? actionYesText;

  const RowButton({
    super.key,
    this.onNoAction,
    this.actionNoColor,
    this.actionNoText,
    this.onYesAction,
    this.actionYesColor,
    this.actionYesText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onNoAction,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: actionNoColor ?? AppColors.oceanTealLight,
              textStyle: TextStyle(
                fontSize: AppSizes.s12,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: FittedBox(
              child: Text(
                actionNoText ?? AppConstants.ACT_HAVE_NOT_SAFE,
              ),
            ),
          ),
        ),
        AppSizes.s28.toHorizontalSpace(),
        Expanded(
          child: ElevatedButton(
            onPressed: onYesAction,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: actionYesColor,
              textStyle: TextStyle(
                fontSize: AppSizes.s12,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: FittedBox(
              child: Text(
                actionYesText ?? AppConstants.ACT_YES_ALREADY_SAFE,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

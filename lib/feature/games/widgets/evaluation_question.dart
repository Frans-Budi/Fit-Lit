import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/helper/text_input_style_helper.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/common/widgets/input/text_input_basic.dart';
import 'package:flutter/material.dart';

class EvaluationQuestion extends StatelessWidget {
  final int number;
  final String questionText;
  final Color? foregroundColor;
  final Color? inputBackgroundColor;
  final Color? borderColor;
  final TextInputStyle style;
  final TextEditingController? controller;

  const EvaluationQuestion({
    super.key,
    required this.number,
    required this.questionText,
    this.controller,
    this.foregroundColor,
    this.borderColor,
    this.style = TextInputStyle.blue,
    this.inputBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$number.',
              style: TextStyles.labelTextForm(color: foregroundColor),
            ),
            AppSizes.s4.toHorizontalSpace(),
            Expanded(
              child: Text(
                questionText,
                style: TextStyles.labelTextForm(color: foregroundColor),
              ),
            ),
          ],
        ),
        AppSizes.s8.toVerticalSpace(),
        TextInputBasic(
          hintText: AppConstants.HINT_TEXT_FIELD_EVALUATION,
          textInputAction: TextInputAction.next,
          controller: controller,
          borderColor: borderColor,
          style: style,
        ),
      ],
    );
  }
}

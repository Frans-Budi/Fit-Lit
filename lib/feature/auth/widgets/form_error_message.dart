import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class FormErrorMessage extends StatelessWidget {
  final String message;
  final bool? isValid;
  final AlignmentGeometry alignment;

  const FormErrorMessage(
      {super.key,
      required this.message,
      this.isValid = true,
      this.alignment = Alignment.topRight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppSizes.s20),
      child: Align(
        alignment: alignment,
        child: isValid!
            ? const SizedBox()
            : Text(
                message,
                style: TextStyle(
                  color: AppColors.redLight,
                  fontSize: FontSize.s12,
                ),
              ),
      ),
    );
  }
}

import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/feature/auth/widgets/form_error_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputWithError extends StatelessWidget {
  final RxString message;
  final Widget child;

  const InputWithError({
    super.key,
    required this.message,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        AppSizes.s2.toVerticalSpace(),
        Obx(
          () => FormErrorMessage(
            message: message.value,
            isValid: message.value == "",
          ),
        ),
      ],
    );
  }
}

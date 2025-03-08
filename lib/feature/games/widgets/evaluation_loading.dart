import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/widgets/skelton/skelton.dart';
import 'package:flutter/material.dart';

class EvaluationLoading extends StatelessWidget {
  const EvaluationLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skelton(
              width: AppSizes.s220,
              height: AppSizes.s25,
            ),
            AppSizes.s6.toVerticalSpace(),
            Skelton(
              width: double.infinity,
              height: AppSizes.s45,
              boxShape: BoxShape.rectangle,
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => AppSizes.s12.toVerticalSpace(),
    );
  }
}

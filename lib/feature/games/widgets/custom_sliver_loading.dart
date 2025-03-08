import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/widgets/skelton/skelton.dart';
import 'package:flutter/material.dart';

class CustomSliverLoading extends StatelessWidget {
  const CustomSliverLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: AppSizes.s24,
        right: AppSizes.s24,
        top: AppSizes.s24,
        bottom: AppSizes.s50,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: AppSizes.s24,
          crossAxisSpacing: AppSizes.s24,
          childAspectRatio: 0.74, // Aspect ratio of grid items
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: 6,
          (context, index) {
            return Container(
              padding: EdgeInsets.all(AppSizes.s8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(AppSizes.s24),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: AppSizes.s12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.s24),
                      ),
                      child: const Skelton(
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Skelton(
                        width: AppSizes.s100,
                        height: 20,
                      ),
                      AppSizes.s8.toVerticalSpace(),
                      Skelton(
                        width: AppSizes.s120,
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

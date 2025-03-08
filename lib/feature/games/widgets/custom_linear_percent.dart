import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CustomLinearPercent extends StatelessWidget {
  final Color? progressColor;
  final int percent;

  const CustomLinearPercent({
    super.key,
    this.progressColor,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
      child: LinearPercentIndicator(
        percent: percent == 0 ? 0.04 : percent / 100,
        lineHeight: 6,
        progressColor: progressColor,
        backgroundColor: Colors.white,
        animation: false,
        barRadius: const Radius.circular(20),
      ),
    );
  }
}

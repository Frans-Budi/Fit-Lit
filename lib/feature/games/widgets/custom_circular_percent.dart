import 'package:fit_lit/common/gen/assets.gen.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircularPercent extends StatelessWidget {
  final Color foregroundColor;
  final int percent;

  const CustomCircularPercent({
    super.key,
    required this.foregroundColor,
    this.percent = 0,
  });

  @override
  Widget build(BuildContext context) {
    if (percent == 100) {
      return Assets.icons.icCheck.svg(width: AppSizes.s35);
    }
    return CircularPercentIndicator(
      radius: 21,
      lineWidth: 6,
      center: Text(
        '$percent%',
        style: TextStyle(
          fontSize: FontSize.s11,
          fontWeight: FontWeight.w800,
          color: foregroundColor,
        ),
      ),
      animation: true,
      circularStrokeCap: CircularStrokeCap.round,
      percent: percent == 0 ? 0.02 : percent / 100,
      backgroundColor: Colors.white,
      progressColor: foregroundColor,
    );
  }
}

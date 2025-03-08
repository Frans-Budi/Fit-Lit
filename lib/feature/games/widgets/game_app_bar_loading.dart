import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class GameAppBarLoading extends StatelessWidget {
  final Color? color;
  const GameAppBarLoading({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppSizes.s70, top: AppSizes.paddingTop),
      child: Align(
        alignment: Alignment.centerRight,
        child: CircularProgressIndicator(color: color),
      ),
    );
  }
}

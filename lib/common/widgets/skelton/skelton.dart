import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skelton extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxShape boxShape;

  const Skelton({
    super.key,
    this.width,
    this.height,
    this.boxShape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      period: const Duration(milliseconds: 2200),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: boxShape == BoxShape.circle
              ? BoxShape.circle
              : BoxShape.rectangle,
          borderRadius:
              boxShape == BoxShape.circle ? null : BorderRadius.circular(12),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

extension DoubleExtention on double {
  Widget toHorizontalSpace() => SizedBox(width: this);
  Widget toVerticalSpace() => SizedBox(height: this);
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension CustomSafeAreaPadding on BuildContext {
  double customBottomPadding(double target) {
    final double scaledTarget = target.h;
    double deviceBottomPadding = MediaQuery.of(this).padding.bottom;
    return max(scaledTarget, deviceBottomPadding);
  }
}

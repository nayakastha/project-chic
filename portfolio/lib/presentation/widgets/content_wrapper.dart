import 'package:flutter/material.dart';

import '../../core/layout/adaptive.dart';
import '../../values/values.dart';

class ContentWrapper extends StatelessWidget {
  const ContentWrapper({
    Key? key,
    this.width,
    this.height,
    this.color = AppColors.grey100,
    this.gradient,
    this.child,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color color;
  final Gradient? gradient;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? widthOfScreen(context),
      height: height ?? heightOfScreen(context),
      decoration: BoxDecoration(color: color, gradient: gradient),
      child: child,
    );
  }
}

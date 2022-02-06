import 'package:flutter/material.dart';

import '../../values/values.dart';

class HorizontalBar extends StatelessWidget {
  const HorizontalBar({
    Key? key,
    this.width = Sizes.WIDTH_20,
    this.height = Sizes.HEIGHT_2,
    this.color = AppColors.accentColor2, //AppColors.secondaryColor
    this.margin,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      color: color,
    );
  }
}

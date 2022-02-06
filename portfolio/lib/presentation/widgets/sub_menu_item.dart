import 'package:flutter/material.dart';

import 'spaces.dart';

// ignore: must_be_immutable
class SubMenuItem extends StatelessWidget {
  SubMenuItem({
    Key? key,
    required this.title,
    this.color,
    this.thickness,
    this.textStyle,
    bool? isSelected,
  }) : super(key: key);

  final String title;
  bool? isSelected;
  final Color? color;
  final double? thickness;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedOpacity(
            opacity: isSelected! ? 1 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: VerticalDivider(
              color: color,
              thickness: thickness,
            ),
          ),
          isSelected! ? SpaceW8() : Container(),
          Text(
            title,
            style: textStyle ?? theme.textTheme.headline6!.copyWith(),
          )
        ],
      ),
    );
  }
}

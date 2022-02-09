import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utils/functions.dart';
import '../../values/values.dart';
import 'horizontal_bar.dart';

class Socials extends StatelessWidget {
  const Socials({
    Key? key,
    this.isVertical = false,
    this.isHorizontal = false,
    this.color = AppColors.accentColor2,
    this.barColor = AppColors.accentColor2,
    this.alignment,
    this.crossAxisAlignment,
  }) : assert(isHorizontal == false || isVertical == false,
            'Both isHorizontal and isVertical cannot be true');

  final bool isVertical;
  final bool isHorizontal;
  final Color color;
  final Color barColor;
  final Alignment? alignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return isVertical
        ? Column(
            crossAxisAlignment: crossAxisAlignment!,
            children: [
              SocialButton(
                icon: FontAwesomeIcons.github,
                alignment: alignment,
                onPressed: () {
                  Functions.launchUrl(StringConst.GITHUB_URL);
                },
                color: color,
              ),
              HorizontalBar(
                width: Sizes.WIDTH_32,
                color: barColor,
                margin: EdgeInsets.symmetric(vertical: Sizes.MARGIN_4),
              ),
              SocialButton(
                icon: FontAwesomeIcons.linkedin,
                alignment: alignment,
                onPressed: () {
                  Functions.launchUrl(StringConst.LINKED_IN_URL);
                },
                color: color,
              ),
              HorizontalBar(
                width: Sizes.WIDTH_32,
                color: barColor,
                margin: EdgeInsets.symmetric(vertical: Sizes.MARGIN_4),
              ),
              SocialButton(
                icon: FontAwesomeIcons.twitter,
                alignment: alignment,
                onPressed: () {
                  Functions.launchUrl(StringConst.TWITTER_URL);
                },
                color: color,
              ),
              HorizontalBar(
                width: Sizes.WIDTH_32,
                color: barColor,
                margin: EdgeInsets.symmetric(vertical: Sizes.MARGIN_4),
              ),
              SocialButton(
                icon: FontAwesomeIcons.mediumM,
                alignment: alignment,
                onPressed: () {
                  Functions.launchUrl(StringConst.MEDIUM_URL);
                },
                color: color,
              ),
            ],
          )
        : IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  icon: FontAwesomeIcons.github,
                  alignment: alignment,
                  onPressed: () {
                    Functions.launchUrl(StringConst.GITHUB_URL);
                  },
                  color: color,
                ),
                VerticalDivider(
                  width: Sizes.WIDTH_8,
                  thickness: 2,
                  color: barColor,
                ),
                SocialButton(
                  icon: FontAwesomeIcons.linkedin,
                  alignment: alignment,
                  onPressed: () {
                    Functions.launchUrl(StringConst.LINKED_IN_URL);
                  },
                  color: color,
                ),
                VerticalDivider(
                  width: Sizes.WIDTH_8,
                  thickness: 2,
                  color: barColor,
                ),
                SocialButton(
                  icon: FontAwesomeIcons.twitter,
                  alignment: alignment,
                  onPressed: () {
                    Functions.launchUrl(StringConst.TWITTER_URL);
                  },
                  color: color,
                ),
                VerticalDivider(
                  width: Sizes.WIDTH_8,
                  thickness: 2,
                  color: barColor,
                ),
                SocialButton(
                  icon: FontAwesomeIcons.telegramPlane,
                  alignment: alignment,
                  onPressed: () {
                    Functions.launchUrl(StringConst.TELEGRAM_URL);
                  },
                  color: color,
                ),
              ],
            ),
          );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    this.padding = const EdgeInsets.all(Sizes.PADDING_0),
    this.onPressed,
    this.color = AppColors.accentColor2,
    this.icon = FontAwesomeIcons.twitter,
    this.iconSize = Sizes.ICON_SIZE_24,
    this.alignment = Alignment.center,
  });

  final EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;
  final Color color;
  final IconData icon;
  final double iconSize;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding,
      onPressed: onPressed,
      alignment: alignment!,
      icon: Icon(
        icon,
        color: color,
        size: iconSize,
      ),
    );
  }
}

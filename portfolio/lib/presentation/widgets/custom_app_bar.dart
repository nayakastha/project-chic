import 'package:flutter/material.dart';

import '../../core/utils/functions.dart';
import '../../values/values.dart';
import 'circular_container.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.titleTextStyle,
    this.leading,
    this.onLeadingPressed,
    this.actions,
    this.onActionsPressed,
    this.actionIcon,
    this.bottom,
  }) : super(key: key);

  final String? title;
  final TextStyle? titleTextStyle;
  final Widget? leading;
  final VoidCallback? onLeadingPressed;
  final List<Widget>? actions;
  final VoidCallback? onActionsPressed;
  final Icon? actionIcon;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AppBar(
      title: Text(
        title!,
        style: titleTextStyle ??
            theme.textTheme.headline6!.copyWith(
              color: AppColors.secondaryColor,
            ),
      ),
      backgroundColor: AppColors.primaryColor,
      bottom: bottom,
      leading: leading ??
          IconButton(
            padding: const EdgeInsets.only(
              left: Sizes.PADDING_24,
              top: Sizes.PADDING_8,
              bottom: Sizes.PADDING_8,
            ),
            onPressed: onLeadingPressed,
            icon: const Icon(
              Icons.menu,
              color: AppColors.secondaryColor,
            ),
          ),
      actions: actions ??
          [
            Padding(
              padding: const EdgeInsets.only(
                right: Sizes.PADDING_24,
                top: Sizes.PADDING_8,
                bottom: Sizes.PADDING_8,
              ),
              child: CircularContainer(
                color: AppColors.grey100,
                width: Sizes.WIDTH_40,
                height: Sizes.HEIGHT_40,
                child: InkWell(
                  child: actionIcon ??
                      const Icon(
                        Icons.email,
                        color: AppColors.accentColor2,
                        size: Sizes.ICON_SIZE_20,
                      ),
                  onTap: onActionsPressed ??
                      () {
                        Functions.launchUrl(StringConst.EMAIL_URL);
//                        Navigator.pushNamed(
//                          context,
//                          ContactPage.contactPageRoute,
//                        );
                      },
                ),
              ),
            )
          ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:portfolio/presentation/widgets/spaces.dart';

import '../../core/layout/adaptive.dart';
import '../../core/utils/functions.dart';
import '../../values/values.dart';
import 'circular_container.dart';
import 'menu_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
    required this.menuList,
    this.color = AppColors.secondaryColor,
    this.width,
    this.selectedItemRouteName,
    this.onClose,
  }) : super(key: key);

  final Color color;
  final double? width;
  final String? selectedItemRouteName;
  final List<MenuData> menuList;
  final GestureTapCallback? onClose;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      color: color,
      width: width ??
          assignWidth(
            context: context,
            fraction: 0.65,
          ), //widthOfScreen(context),
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(Sizes.PADDING_16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: onClose ??
                        () {
                          Navigator.pop(context);
                        },
                    child: const CircularContainer(
                      color: AppColors.accentColor2,
                      width: Sizes.WIDTH_30,
                      height: Sizes.HEIGHT_30,
                      child: Icon(
                        Icons.close,
                        size: Sizes.ICON_SIZE_20,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ..._buildMenuList(menuList: menuList, context: context),
              ],
            ),
            const Spacer(flex: 1),
            const SpaceH16(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringConst.DESIGNED_IN,
                  style: theme.textTheme.bodyText1!.copyWith(
                    color: AppColors.accentColor2,
                    fontSize: Sizes.TEXT_SIZE_12,
                  ),
                ),
                const SpaceW4(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringConst.BUILT_BY,
                  style: theme.textTheme.bodyText1!.copyWith(
                    color: AppColors.accentColor2,
                    fontSize: Sizes.TEXT_SIZE_12,
                  ),
                ),
              ],
            ),
            const SpaceH16(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<MenuData> menuList,
  }) {
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        Menuitem(
          onTap: () {
            if (menuList[i].title == StringConst.RESUME) {
              Functions.launchUrl(DocumentPath.cv);
            } else if (menuList[i].title == StringConst.CONTACT) {
              Functions.launchUrl(StringConst.EMAIL_URL);
            } else {
              Navigator.of(context).pushNamed(menuList[i].routeName);
            }
          },
          title: menuList[i].title,
          isMobile: true,
          selected:
              selectedItemRouteName == menuList[i].routeName ? true : false,
        ),
      );
      menuItems.add(const SpaceH16());
    }
    return menuItems;
  }
}

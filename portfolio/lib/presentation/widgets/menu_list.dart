import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/spaces.dart';

import '../../core/utils/functions.dart';
import '../../values/values.dart';
import 'menu_item.dart';
import 'socials.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    Key? key,
    required this.menuList,
    this.selectedItemRouteName,
  }) : super(key: key);

  final List<MenuData> menuList;
  final String? selectedItemRouteName;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ..._buildMenuList(menuList: menuList, context: context),
        const Spacer(
          flex: 20,
        ),
        Text(
          StringConst.DEV_NAME,
          style: theme.textTheme.headline4!.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
        Text(
          StringConst.SPECIALITY,
          style: theme.textTheme.headline6!.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
        const Socials(
          isHorizontal: true,
          alignment: Alignment.center,
          color: AppColors.secondaryColor,
          barColor: AppColors.secondaryColor,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        const Spacer(
          flex: 1,
        ),
        Row(
          children: [
            const SpaceH2(),
            Text(
              StringConst.DESIGNED_IN,
              style: theme.textTheme.bodyText1!.copyWith(
                color: AppColors.secondaryColor,
                fontSize: Sizes.TEXT_SIZE_10,
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            const SpaceH2(),
            Text(
              StringConst.BUILT_BY,
              style: theme.textTheme.bodyText1!.copyWith(
                color: AppColors.secondaryColor,
                fontSize: Sizes.TEXT_SIZE_12,
              ),
            ),
          ],
        ),
      ],
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
          selected:
              selectedItemRouteName == menuList[i].routeName ? true : false,
        ),
      );
      menuItems.add(const SpaceH4());
    }
    return menuItems;
  }
}

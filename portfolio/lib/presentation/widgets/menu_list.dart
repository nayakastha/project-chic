import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      children: <Widget>[
        ..._buildMenuList(menuList: menuList, context: context),
        const Spacer(
          flex: 1,
        ),
        Socials(
          isVertical: true,
          alignment: Alignment.centerLeft,
          color: AppColors.secondaryColor,
          barColor: AppColors.secondaryColor,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        const Spacer(
          flex: 1,
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
        SpaceH20(),
        Row(
          children: [
            Text(
              StringConst.DESIGNED_IN,
              style: theme.textTheme.bodyText1!.copyWith(
                color: AppColors.secondaryColor,
                fontSize: Sizes.TEXT_SIZE_10,
              ),
            ),
            SpaceW4(),
            const Icon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
              size: Sizes.ICON_SIZE_10,
            )
          ],
        ),
        Wrap(
          children: [
            Text(
              StringConst.BUILT_BY + ", " + StringConst.DESIGNED_BY,
              style: theme.textTheme.bodyText1!.copyWith(
                color: AppColors.secondaryColor,
                fontSize: Sizes.TEXT_SIZE_10,
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
              Functions.launchUrl(DocumentPath.CV);
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
      menuItems.add(SpaceH4());
    }
    return menuItems;
  }
}

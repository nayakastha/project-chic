import 'package:flutter/material.dart';

import '../../../values/values.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/experience_section.dart';
import 'experience_page.dart';

class ExperiencePageMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  ExperiencePageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: Data.experienceData.length,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.secondaryColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: CustomAppBar(
            title: StringConst.WORK,
            onLeadingPressed: () {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState!.openEndDrawer();
              } else {
                _scaffoldKey.currentState!.openDrawer();
              }
            },
            bottom: TabBar(
              tabs: _buildTabBar(Data.experienceData, context),
              isScrollable: true,
              indicatorColor: AppColors.secondaryColor,
              labelColor: AppColors.secondaryColor,
              labelPadding: const EdgeInsets.all(Sizes.PADDING_8),
              labelStyle: theme.textTheme.headline6!.copyWith(
                fontSize: Sizes.TEXT_SIZE_16,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelColor: AppColors.accentColor,
              unselectedLabelStyle: theme.textTheme.bodyText1!.copyWith(
                fontSize: Sizes.TEXT_SIZE_12,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: const [],
          ),
        ),
        drawer: AppDrawer(
          menuList: Data.menuList,
          selectedItemRouteName: ExperiencePage.experiencePageRoute,
        ),
        body: TabBarView(
          children: _buildTabContent(Data.experienceData),
        ),
      ),
    );
  }

  List<Widget> _buildTabBar(
      List<ExperienceData> experienceData, BuildContext context) {
    List<Widget> tabBarItems = [];
    for (var index = 0; index < experienceData.length; index++) {
      tabBarItems.add(
        Text(experienceData[index].company!),
      );
    }
    return tabBarItems;
  }

  List<Widget> _buildTabContent(List<ExperienceData> experienceData) {
    List<Widget> tabContent = [];
    for (var index = 0; index < experienceData.length; index++) {
      tabContent.add(
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_12,
            vertical: Sizes.PADDING_16,
          ),
          child: ExperienceSection(
            position: experienceData[index].position,
            company: experienceData[index].company,
            duration: experienceData[index].duration,
            location: experienceData[index].location,
            roles: experienceData[index].roles,
            companyUrl: experienceData[index].companyUrl,
          ),
        ),
      );
    }
    return tabContent;
  }
}

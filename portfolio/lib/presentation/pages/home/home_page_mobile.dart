import 'package:flutter/material.dart';

import '../../../core/layout/adaptive.dart';
import '../../../core/utils/functions.dart';
import '../../../values/values.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/circular_container.dart';
import '../../widgets/content_wrapper.dart';
import '../../widgets/socials.dart';
import '../../widgets/spaces.dart';
import 'home_page.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({Key? key}) : super(key: key);

  @override
  _HomePageMobileState createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: HomePage.homePageRoute,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  ContentWrapper(
                    width: assignWidth(context: context, fraction: 0.8),
                    color: AppColors.primaryColor,
//                        gradient: Gradients.primaryGradient,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: assignHeight(
                            context: context,
                            fraction: 0.2,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: ListBody(
                            children: [
                              Text(
                                StringConst.DEV_NAME,
                                style: theme.textTheme.headline4!.copyWith(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              const SpaceH8(),
                              Text(
                                StringConst.SPECIALITY,
                                style: theme.textTheme.headline6!.copyWith(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              const SpaceH8(),
                              const Socials(
                                isHorizontal: true,
                                showResume: true,
                                color: AppColors.secondaryColor,
                                alignment: Alignment.center,
                                barColor: AppColors.secondaryColor,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                              const SpaceH8(),
                            ],
                          ),
                        ),
                        const Spacer(flex: 1),
                        SizedBox(
                          height: assignHeight(
                            context: context,
                            fraction: 0.05,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ContentWrapper(
                    width: assignWidth(context: context, fraction: 0.2),
                    color: AppColors.secondaryColor,
                    child: Container(),
                  ),
                ],
              )
            ],
          ),
          _buildAppBar(),
          //_buildDevImage(),
          _buildSocials(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_16,
        vertical: Sizes.PADDING_16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState!.openEndDrawer();
              } else {
                _scaffoldKey.currentState!.openDrawer();
              }
            },
            icon: const Icon(Icons.menu),
          ),
          CircularContainer(
            color: AppColors.primaryColor,
            child: InkWell(
              onTap: () {
                Functions.launchUrl(StringConst.EMAIL_URL);
//                Navigator.pushNamed(
//                  context,
//                  ContactPage.contactPageRoute,
//                );
              },
              child: const Icon(
                Icons.email,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocials() {
    return const Positioned(
      right: Sizes.SIZE_16,
      bottom: Sizes.SIZE_30,
      child: Socials(
        isVertical: true,
        alignment: Alignment.centerRight,
        color: AppColors.secondaryColor,
        barColor: AppColors.secondaryColor,
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
    );
  }
}

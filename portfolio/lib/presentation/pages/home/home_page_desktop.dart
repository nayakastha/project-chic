import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../core/layout/adaptive.dart';
import '../../../core/utils/functions.dart';
import '../../../values/values.dart';
import '../../widgets/circular_container.dart';
import '../../widgets/content_wrapper.dart';
import '../../widgets/menu_list.dart';
import '../../widgets/spaces.dart';
import '../../widgets/trailing_info.dart';
import 'home_page.dart';

class HomePageDesktop extends StatefulWidget {
  const HomePageDesktop({Key? key}) : super(key: key);

  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
//  GlobalKey imageKey = GlobalKey();
//  double offsetRoleLeaf;
//
//  @override
//  void initState() {
//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      _getSizeOfImage();
//    });
//    super.initState();
//  }
//
//  _getSizeOfImage() {
//    final RenderBox imageRenderBox = imageKey.currentContext.findRenderObject();
//    final imageSize = imageRenderBox.size.height;
//    setState(() {
//      print("Size ${imageRenderBox.size}");
//      offsetRoleLeaf = 0;
//    });
//  }

  Future<ui.Image> _getImage() {
    Completer<ui.Image> completer = Completer<ui.Image>();
    const AssetImage(ImagePath.DEV)
        .resolve(const ImageConfiguration())
        .addListener(
      ImageStreamListener(
        (ImageInfo image, bool _) {
          completer.complete(image.image);
        },
      ),
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double widthOfImage = assignWidth(context: context, fraction: 0.4);

    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ContentWrapper(
                  width: assignWidth(context: context, fraction: 0.5),
                  color: AppColors.primaryColor,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: Sizes.MARGIN_20,
                      top: Sizes.MARGIN_20,
                      bottom: Sizes.MARGIN_20,
                    ),
                    child: MenuList(
                      menuList: Data.menuList,
                      selectedItemRouteName: HomePage.homePageRoute,
                    ),
                  ),
                ),
                ContentWrapper(
                  width: assignWidth(context: context, fraction: 0.5),
                  color: AppColors.secondaryColor,
                  child: TrailingInfo(
                    onLeadingWidgetPressed: () {
                      Functions.launchUrl(StringConst.EMAIL_URL);
                    },
                    leadingWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          StringConst.SEND_ME_A_MESSAGE,
                          style: theme.textTheme.bodyText1!.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SpaceW8(),
                        const CircularContainer(
                          width: Sizes.WIDTH_24,
                          height: Sizes.HEIGHT_24,
                          color: AppColors.primaryColor,
                          child: Icon(
                            Icons.add,
                            color: AppColors.secondaryColor,
                            size: Sizes.ICON_SIZE_20,
                          ),
                        )
                      ],
                    ),
                    // onTrailingWidgetPressed: () {
                    //   Navigator.pushNamed(
                    //     context,
                    //     PortfolioPage.portfolioPageRoute,
                    //   );
                    // },
                    // trailingWidget: Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Text(
                    //       StringConst.VIEW_PORTFOLIO,
                    //       style: theme.textTheme.bodyText1!.copyWith(
                    //         color: AppColors.primaryColor,
                    //       ),
                    //     ),
                    //     SpaceW8(),
                    //     const CircularContainer(
                    //       color: AppColors.primaryColor,
                    //       width: Sizes.WIDTH_24,
                    //       height: Sizes.HEIGHT_24,
                    //       child: Icon(
                    //         Icons.chevron_right,
                    //         color: AppColors.secondaryColor,
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ),
                ),
              ],
            )
          ],
        ),
        // isDisplaySmallDesktop(context)
        //     ? FutureBuilder<ui.Image>(
        //         future: _getImage(),
        //         builder:
        //             (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        //           if (snapshot.hasData) {
        //             ui.Image image = snapshot.data!;
        //             return Positioned(
        //               top: assignHeight(context: context, fraction: 0.0),
        //               left: assignWidth(context: context, fraction: 0.5) -
        //                   (image.width + 100.0) / 2,
        //               child: Image.asset(
        //                 ImagePath.DEV,
        //                 width: (image.width + 100.0),
        //                 height: assignHeight(context: context, fraction: 1.0),
        //                 fit: BoxFit.cover,
        //                 scale: 3.0,
        //               ),
        //             );
        //           } else {
        //             return const Text('Loading...');
        //           }
        //         },
        //       )
        //     : Positioned(
        //         top: assignHeight(context: context, fraction: 0.05),
        //         left: assignWidth(context: context, fraction: 0.5) -
        //             widthOfImage / 2,
        //         child: Image.asset(
        //           ImagePath.DEV,
        //           width: widthOfImage,
        //           height: assignHeight(context: context, fraction: 1),
        //           fit: BoxFit.cover,
        //           scale: 2.0,
        //         ),
        //       ),
      ],
    );
  }
}

//          Positioned(
////            key: imageKey,
//            top: assignHeight(context: context, fraction: 0.0),
//            left: assignWidth(context: context, fraction: 0.5) - 600 / 2,
//            child: Container(
////              color: Colors.red,
//              child: Image.asset(
//                ImagePath.DEV,
//                width: 600,
//                height: assignHeight(context: context, fraction: 1),
//                fit: BoxFit.cover,
//                scale: 2.0,
//              ),
//            ),
//          ),

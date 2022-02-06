import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../values/values.dart';
import 'about_page_desktop.dart';
import 'about_page_mobile.dart';

class AboutPage extends StatelessWidget {
  static const String aboutPageRoute = StringConst.ABOUT_PAGE;

  const AboutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: const AboutPageMobile(),
        tablet: AboutPageDesktop(),
        desktop: AboutPageDesktop(),
      ),
    );
  }
}

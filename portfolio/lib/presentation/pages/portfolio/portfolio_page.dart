import 'package:flutter/material.dart';
import 'package:portfolio/presentation/pages/portfolio/portfolio_page_mobile.dart';

import 'package:responsive_builder/responsive_builder.dart';

import '../../../values/values.dart';
import 'portfolio_page_desktop.dart';

class PortfolioPage extends StatelessWidget {
  static const String portfolioPageRoute = StringConst.PORTFOLIO_PAGE;

  const PortfolioPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: ScreenTypeLayout(
          mobile: const PortfolioPageMobile(),
          tablet: const PortfolioPageDesktop(),
          desktop: const PortfolioPageDesktop(),
        ),
      ),
    );
  }
}

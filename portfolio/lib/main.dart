import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app_theme.dart';
import 'package:portfolio/presentation/routes/routes.dart';
import 'package:portfolio/values/values.dart';

import 'presentation/pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConst.APP_TITLE,
      theme: AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.homePageRoute,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}

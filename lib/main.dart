import 'package:easy_job_app/routes.dart';
import 'package:easy_job_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants.dart';
import 'screens/auth/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [
        Locale('de'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'EasyJob',
      theme: this.lightThemeData(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }

  // light Theme
  ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: kTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),
        focusColor: kPrimaryColor,
        // primarySwatch: kPrimaryGradientColor.colors
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: kPrimaryColor),
        tabBarTheme: TabBarTheme(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: kPrimaryColor
            )
          )
        )
    );
  }

  // dark Theme
  ThemeData darkThemeData(BuildContext context) {
    return ThemeData.dark().copyWith(
        primaryColor: Color(0xFFFF1D00),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF24A751)));
  }
}

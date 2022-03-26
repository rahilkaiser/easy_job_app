import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kPrimaryColor,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: const TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ).bodyText2,
    titleTextStyle: const TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ).headline6,
  );
}

ThemeData appBarThemeSearch(BuildContext context) {
  final ThemeData theme = Theme.of(context);
  final ColorScheme colorScheme = theme.colorScheme;
  return theme.copyWith(
    appBarTheme: AppBarTheme(
      brightness: colorScheme.brightness,
      backgroundColor: colorScheme.brightness == Brightness.dark
          ? Colors.grey[900]
          : Colors.white,
      iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      textTheme: theme.textTheme,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: theme.inputDecorationTheme.hintStyle,
      border: InputBorder.none,
    ),
  );
}

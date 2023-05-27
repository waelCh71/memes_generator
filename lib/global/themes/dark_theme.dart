import 'package:flutter/material.dart';

import 'colors.dart';

class DarkTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: myBlack,
    backgroundColor: myBlack,
    scaffoldBackgroundColor: myGrey,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: myWhite,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: myWhite,
      ),
      headline2: TextStyle(
        color: myWhite,
      ),
      bodyText1: TextStyle(color: myWhite),
      bodyText2: TextStyle(color: myblue),
    ).apply(fontFamily: "Allan"),
    iconTheme: const IconThemeData(
      color: myBlack,
      opacity: 0.4,
    ),
  );

  ThemeData getDarkTheme() => darkTheme;
}

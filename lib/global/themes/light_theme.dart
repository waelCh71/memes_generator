import 'package:flutter/material.dart';

import 'colors.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: myWhite,

    //backgroundColor: myWhite,
    scaffoldBackgroundColor: myWhite,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: myBlack,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: myBlack,
      ),
      headline2: TextStyle(
        color: myBlack,
      ),
      bodyText1: TextStyle(color: mypink),
      bodyText2: TextStyle(color: Colors.blueGrey),
    ).apply(fontFamily: "Allan"),
    iconTheme: const IconThemeData(
      color: myWhite,
      opacity: 0.4,
    ),
  );

  ThemeData getLightTheme() => lightTheme;
}

import 'package:to_do_app/core/theme/text_size.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme getLightTextTheme() => TextTheme(
        headline1: TextStyle(
          fontSize: TextSize.size96,
          fontWeight: FontWeight.w300,
          color: Colors.black54,
          letterSpacing: -1.5,
        ),
        headline2: TextStyle(
          fontSize: TextSize.size60,
          fontWeight: FontWeight.w300,
          color: Colors.black54,
          letterSpacing: -0.5,
        ),
        headline3: TextStyle(
          fontSize: TextSize.size48,
          fontWeight: FontWeight.w300,
          color: Colors.black54,
          letterSpacing: 0,
        ),
        headline4: TextStyle(
          fontSize: TextSize.size34,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
          letterSpacing: 0.25,
        ),
        headline5: TextStyle(
          fontSize: TextSize.size24,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
          letterSpacing: 0.0,
        ),
        headline6: TextStyle(
          fontSize: TextSize.size20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Colors.black87,
        ),
        subtitle1: TextStyle(
          fontSize: TextSize.size16,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
          letterSpacing: 0.15,
        ),
        subtitle2: TextStyle(
          fontSize: TextSize.size14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          letterSpacing: 0.10,
        ),
        bodyText1: TextStyle(
          fontSize: TextSize.size16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: Colors.black87,
        ),
        bodyText2: TextStyle(
          fontSize: TextSize.size14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Colors.black87,
        ),
        button: TextStyle(
          fontSize: TextSize.size14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.75,
          color: Colors.black87,
        ),
        caption: TextStyle(
          fontSize: TextSize.size12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: Colors.black,
        ),
        overline: TextStyle(
          fontSize: TextSize.size10,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: Colors.black54,
        ),
      );
  static TextTheme getDarkTextTheme() => TextTheme(
        headline1: TextStyle(
          fontSize: TextSize.size96,
          fontWeight: FontWeight.w300,
          color: Colors.white70,
          letterSpacing: -1.5,
        ),
        headline2: TextStyle(
          fontSize: TextSize.size60,
          fontWeight: FontWeight.w300,
          color: Colors.white70,
          letterSpacing: -0.5,
        ),
        headline3: TextStyle(
          fontSize: TextSize.size48,
          fontWeight: FontWeight.w300,
          color: Colors.white70,
          letterSpacing: 0,
        ),
        headline4: TextStyle(
          fontSize: TextSize.size34,
          fontWeight: FontWeight.w400,
          color: Colors.white70,
          letterSpacing: 0.25,
        ),
        headline5: TextStyle(
          fontSize: TextSize.size24,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 0.0,
        ),
        headline6: TextStyle(
          fontSize: TextSize.size20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Colors.white,
        ),
        subtitle1: TextStyle(
          fontSize: TextSize.size16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 0.15,
        ),
        subtitle2: TextStyle(
          fontSize: TextSize.size14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          letterSpacing: 0.10,
        ),
        bodyText1: TextStyle(
          fontSize: TextSize.size16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: Colors.white,
        ),
        bodyText2: TextStyle(
          fontSize: TextSize.size14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Colors.white,
        ),
        button: TextStyle(
          fontSize: TextSize.size14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.75,
          color: Colors.white,
        ),
        caption: TextStyle(
          fontSize: TextSize.size12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: Colors.white70,
        ),
        overline: TextStyle(
          fontSize: TextSize.size10,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: Colors.white,
        ),
      );
}

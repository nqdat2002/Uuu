
import 'package:flutter/material.dart';
import 'package:uuu/src/theme/color/dark_color.dart';

import 'color/lightColor.dart';

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
    primaryColor: LightColor.purple,
    // accentColor: LightColor.lightblack,
    primaryColorDark: LightColor.Darker,
    primaryColorLight: LightColor.brighter,
    cardTheme: const CardTheme(color: LightColor.background),
    textTheme: ThemeData.light().textTheme,
    iconTheme: const IconThemeData(color: LightColor.lightblack),
    dividerColor: LightColor.lightGrey,
    disabledColor: LightColor.darkgrey,
    bottomAppBarTheme: const BottomAppBarTheme(color: LightColor.background),
    colorScheme: const ColorScheme(
        primary: LightColor.purple,
        // primaryVariant: LightColor.purple,
        secondary: LightColor.lightBlue,
        // secondaryVariant: LightColor.darkBlue,
        surface: LightColor.background,
        background: LightColor.background,
        error: Colors.red,
        onPrimary: LightColor.Darker,
        onSecondary: LightColor.background,
        onSurface: LightColor.Darker,
        onBackground: LightColor.titleTextColor,
        onError: LightColor.titleTextColor,
        brightness: Brightness.dark).copyWith(primary: Colors.blue, background: LightColor.background),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: DarkColor.purple,
    // accentColor: DarkColor.lightblack,
    primaryColorDark: DarkColor.Darker,
    primaryColorLight: DarkColor.brighter,
    cardTheme: const CardTheme(color: DarkColor.background),
    textTheme: ThemeData.dark()
        .textTheme
        .copyWith(bodyLarge: const TextStyle(color: DarkColor.titleTextColor)),
    iconTheme: const IconThemeData(color: DarkColor.lightblack),
    dividerColor: LightColor.subTitleTextColor,
    bottomAppBarTheme: const BottomAppBarTheme(color: DarkColor.lightblack),
    colorScheme: const ColorScheme(
        primary: DarkColor.purple,
        // primaryVariant: DarkColor.purple,
        secondary: DarkColor.lightBlue,
        // secondaryVariant: DarkColor.darkBlue,
        surface: DarkColor.background,
        background: DarkColor.background,
        error: Colors.red,
        onPrimary: DarkColor.white,
        onSecondary: DarkColor.Darker,
        onSurface: DarkColor.white,
        onBackground: DarkColor.titleTextColor,
        onError: DarkColor.titleTextColor,
        brightness: Brightness.dark).copyWith(primary: Colors.blue, background: DarkColor.background),
  );

  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);
}

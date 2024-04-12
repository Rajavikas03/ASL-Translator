import 'package:flutter/material.dart';
import 'package:translator_2/Const/Color.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color(0xffd2d2d2),
    onPrimary: Colors.black,
    primary: lightBlue,
    primaryContainer: navyBlue,
    tertiary: black,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: D_bg,
    primary: lightBlue,
    onPrimary: Colors.white,
    primaryContainer: black,
    tertiary: D_bg,
    onPrimaryContainer: navyBlue,
  ),
);

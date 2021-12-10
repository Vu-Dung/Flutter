import 'package:flutter/material.dart';

AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: colorBackground,
    iconTheme: IconThemeData(color: Colors.green),
    actionsIconTheme: IconThemeData(color: Colors.amber),
    centerTitle: true,
    elevation: 15,
    titleTextStyle: TextStyle(
        color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20));

ThemeData themeData = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: colorPrimary,
    cardColor: colorBackground,
    errorColor: colorShrineErrorRed,
    appBarTheme: appBarTheme,
  );
}

const Color colorPrimary = Colors.white;
const Color colorBackground = Colors.white;
const Color colorShrineErrorRed = Color(0xFFB00020);
const defaultLetterSpacing = 0.03;

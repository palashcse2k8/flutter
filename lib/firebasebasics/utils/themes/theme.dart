import 'package:flutter/material.dart';
import 'package:flutterbascis/firebasebasics/utils/themes/widgets_themes/elevated_button_theme.dart';
import 'package:flutterbascis/firebasebasics/utils/themes/widgets_themes/outlined_button_theme.dart';
import 'package:flutterbascis/firebasebasics/utils/themes/widgets_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: AppTextTheme.lightTextTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: AppTextTheme.darkTextTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
  );
}


import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AppTextFieldTheme {
  AppTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: appSecondaryColor,
    floatingLabelStyle: TextStyle(color: appSecondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: appSecondaryColor
      )
    )
  );
  static InputDecorationTheme darkInputDecorationTheme = const InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: appPrimaryColor,
      floatingLabelStyle: TextStyle(color: appPrimaryColor),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2.0,
              color: appPrimaryColor
          )
      )
  );
}
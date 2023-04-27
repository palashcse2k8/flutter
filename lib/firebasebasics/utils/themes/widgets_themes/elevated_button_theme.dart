
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  // --- Light Theme ---
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: appWhiteColor,
      backgroundColor: appSecondaryColor,
      shape: const StadiumBorder(),
      side: const BorderSide(
        color: appSecondaryColor,
      ),
      padding: const EdgeInsets.symmetric(
          vertical: appButtonHeight),
    ),
  );

  // --- Dark Theme ---
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: appSecondaryColor,
      backgroundColor: appWhiteColor,
      shape: const StadiumBorder(),
      side: const BorderSide(
        color: appWhiteColor,
      ),
      padding: const EdgeInsets.symmetric(
          vertical: appButtonHeight),
    ),
  );
}

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class AppOutlinedButtonTheme {
  AppOutlinedButtonTheme._();

  // --- Light Theme ---
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        foregroundColor: appSecondaryColor,
        shape: const StadiumBorder(),
        side: const BorderSide(
          color: appSecondaryColor,
        ),
        padding: const EdgeInsets.symmetric(
            vertical: appButtonHeight,
        ),
    ),
  );

  // --- Dark Theme ---
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: appWhiteColor,
      shape: const StadiumBorder(),
      side: const BorderSide(
        color: appWhiteColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: appButtonHeight,
      ),
    ),
  );
}
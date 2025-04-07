import "package:flutter/material.dart";

import "../../constants/const_colors.dart";

class CustomColorScheme{
  CustomColorScheme._();

  static ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ConstColors.primaryColor,  // Primary color for dialogs, buttons, etc.
    onPrimary: Colors.white, // Text color on top of primary color
    secondary: Colors.white,  // Secondary color for FAB, etc.
    onSecondary: ConstColors.primaryColor, // Text color on top of secondary color
    surface: Colors.white, // Background color of cards, dialogs, etc.
    onSurface: ConstColors.lightTextBody, // Text color on surfaces
    error: ConstColors.lightWrongInputField,  // Color for errors
    onError: Colors.white, // Text color on error backgrounds

  );

  static ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,

    primary: ConstColors.primaryColor,  // Primary color for dialogs, buttons, etc.
    onPrimary: Colors.white, // Text color on top of primary color
    secondary: Colors.white,  // Secondary color for FAB, etc.
    onSecondary: ConstColors.primaryColor, // Text color on top of secondary color
    surface: Colors.white, // Background color of cards, dialogs, etc.
    onSurface: Color(0xFFF3F3F3), // Text color on surfaces
    error: Colors.red,  // Color for errors
    onError: Colors.white, // Text color on error backgrounds

  );
}
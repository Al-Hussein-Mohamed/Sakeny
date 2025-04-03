import 'package:flutter/material.dart';
import 'package:sakeny/utils/theme/widget_themes/custom_color_scheme.dart';
import 'package:sakeny/utils/theme/widget_themes/custom_elevated_button_theme.dart';
import 'package:sakeny/utils/theme/widget_themes/custom_text_field_theme.dart';
import 'package:sakeny/utils/theme/widget_themes/custom_text_theme.dart';


class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Lato",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    colorScheme: CustomColorScheme.lightColorScheme,
    inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Lato",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CustomTextTheme.darkTextTheme,
    colorScheme: CustomColorScheme.darkColorScheme,
    inputDecorationTheme: CustomTextFieldTheme.darkInputDecorationTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
  );
}

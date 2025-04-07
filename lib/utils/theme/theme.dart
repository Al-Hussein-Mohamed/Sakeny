import 'package:flutter/material.dart';
import 'package:sakeny/utils/theme/widget_themes/custom_color_scheme.dart';
import 'package:sakeny/utils/theme/widget_themes/custom_elevated_button_theme.dart';
import 'package:sakeny/utils/theme/widget_themes/custom_icon_theme.dart';
import 'package:sakeny/utils/theme/widget_themes/custom_text_field_theme.dart';
import 'package:sakeny/utils/theme/widget_themes/custom_text_theme.dart';

import '../constants/const_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Lato",
    brightness: Brightness.light,
    primaryColor: ConstColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: CustomIconTheme.lightIconTheme,
    textTheme: CustomTextTheme.lightTextTheme,
    colorScheme: CustomColorScheme.lightColorScheme,
    inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Lato",
    brightness: Brightness.dark,
    primaryColor: ConstColors.primaryColor,
    iconTheme: CustomIconTheme.darkIconTheme,
    textTheme: CustomTextTheme.darkTextTheme,
    colorScheme: CustomColorScheme.darkColorScheme,
    scaffoldBackgroundColor: ConstColors.primaryColor,
    inputDecorationTheme: CustomTextFieldTheme.darkInputDecorationTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
  );
}

import 'package:flutter/material.dart';

import '../../constants/const_colors.dart';

class CustomAppBarTheme {
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: ConstColors.primaryColor,
    foregroundColor: Colors.white,
    toolbarHeight: 60,
    titleSpacing: 0,
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: ConstColors.primaryColor,
    foregroundColor: Colors.white,
  );
}

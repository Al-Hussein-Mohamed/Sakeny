import "package:flutter/material.dart";

import "../utils/theme/theme.dart";
class SettingsProvider extends ChangeNotifier{
  ThemeData _themeData = AppTheme.lightTheme;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => themeData == AppTheme.darkTheme;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(int mode) {
    if(mode == 0 && themeData == AppTheme.lightTheme) return;
    if(mode == 1 && themeData == AppTheme.darkTheme) return;
    _themeData = mode == 0 ? AppTheme.lightTheme : AppTheme.darkTheme;

    notifyListeners();
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../utils/constants/const_colors.dart';

void configjEasyLoading(bool isDark) {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = isDark ? const Color(0xFF141922) : Colors.white
    ..textColor = Colors.white
    ..indicatorColor = ConstColors.primaryColor
    ..userInteractions = false
    ..dismissOnTap = false
    ..contentPadding = const EdgeInsets.all(18)
    ..animationDuration = const Duration(milliseconds: 400)
    ..animationStyle = EasyLoadingAnimationStyle.opacity;
}
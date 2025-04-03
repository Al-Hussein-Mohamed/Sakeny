import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/const_colors.dart';

class CustomElevatedButtonTheme{
  CustomElevatedButtonTheme._();

  static final ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: ConstColors.primaryColor,
      // disabledForegroundColor: Colors.grey,
      // disabledBackgroundColor: Colors.grey,
      // side: const BorderSide(color: Colors.blue),
      padding:  EdgeInsets.all(22.r),
      textStyle: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.w700, color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      minimumSize: Size(double.infinity, 50.h),
    ),
  );

  static final ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: ConstColors.primaryColor,
      // disabledForegroundColor: Colors.grey,
      // disabledBackgroundColor: Colors.grey,
      // side: const BorderSide(color: Colors.blue),
      padding:  EdgeInsets.all(25.r),
      textStyle: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.w700, color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      minimumSize: Size(double.infinity, 50.h),
    ),
  );
}
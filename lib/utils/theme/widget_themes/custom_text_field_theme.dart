import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/const_colors.dart';

class CustomTextFieldTheme {
  CustomTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ConstColors.lightInputFieldIcon,
    suffixIconColor: ConstColors.lightInputFieldIcon,

    floatingLabelStyle: TextStyle(fontSize: 24.spMin, fontWeight: FontWeight.w500, color: ConstColors.lightInputField),
    labelStyle: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w500, color: ConstColors.lightInputField),
    hintStyle: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w400, color: ConstColors.lightInputFieldHint),
    errorStyle: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w500, color: ConstColors.lightWrongInputField),


    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: ConstColors.lightInputField, width: 1.0),
      borderRadius: BorderRadius.circular(10.r),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ConstColors.lightInputField, width: 1.0),
      borderRadius: BorderRadius.circular(10.r),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ConstColors.lightInputField, width: 2.0),
      borderRadius: BorderRadius.circular(10.r),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: ConstColors.lightWrongInputField, width: 2.0),
      borderRadius: BorderRadius.circular(10.r),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: ConstColors.lightWrongInputField, width: 2.0),
      borderRadius: BorderRadius.circular(10.r),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(

  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/utils/constants/const_text.dart';

import '../../../utils/constants/const_colors.dart';

class SelectLocation extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final String label;
  final bool isPhoneValid;
  final String? Function(String?)? phoneValidator;

  const SelectLocation({
    super.key,
    required this.padding,
    required this.label,
    required this.isPhoneValid,
    required this.phoneValidator,
  });

  @override
  Widget build(BuildContext context) {
    Color color = isPhoneValid ? ConstColors.lightInputField : ConstColors.lightWrongInputField;
    return Padding(
      padding: padding,
      child: ElevatedButton(onPressed: () {}, child: Text(ConstText.location)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/const_colors.dart';

class PhoneTextField extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final String label;
  final bool isPhoneValid;
  final String? Function(String?)? phoneValidator;
  final TextEditingController phoneController;

  const PhoneTextField({
    super.key,
    required this.padding,
    required this.label,
    required this.isPhoneValid,
    required this.phoneController,
    required this.phoneValidator,
  });

  @override
  Widget build(BuildContext context) {
    Color color = isPhoneValid ? ConstColors.lightInputField : ConstColors.lightWrongInputField;
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: phoneController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone_outlined, size: 28.spMin, color: color),
          label: Text(
            label,
            style: TextStyle().copyWith(color: color),
          ),
        ),
        textInputAction: TextInputAction.next,
        autofillHints: [AutofillHints.telephoneNumber],
        keyboardType: TextInputType.phone,
        validator: phoneValidator,
      ),
    );
  }
}

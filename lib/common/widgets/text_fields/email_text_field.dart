import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_text.dart';
import '../../../utils/validators/validation.dart';

class EmailTextField extends StatelessWidget {
  final bool isEmailValid;
  final String? Function(String?)? emailValidator;
  final TextEditingController emailController;

  const EmailTextField({
    super.key,
    required this.emailController,
    required this.emailValidator,
    required this.isEmailValid,
  });

  @override
  Widget build(BuildContext context) {
    Color color = isEmailValid ? ConstColors.lightInputField : ConstColors.lightWrongInputField;
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_outlined, size: 28.spMin, color: color),
        label: Text(
          ConstText.email,
          style: TextStyle().copyWith(color: color),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: emailValidator,
    );
  }
}

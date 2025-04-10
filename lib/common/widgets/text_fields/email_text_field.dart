import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_text.dart';
import '../../../utils/validators/validation.dart';

class EmailTextField extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final bool isEmailValid;
  final String? Function(String?)? emailValidator;
  final TextEditingController emailController;

  const EmailTextField({
    super.key,
    required this.padding,
    required this.emailController,
    required this.emailValidator,
    required this.isEmailValid,
  });

  @override
  Widget build(BuildContext context) {
    Color color = isEmailValid ? ConstColors.lightInputField : ConstColors.lightWrongInputField;
    return  Hero(
      tag: "email",
      child: Material(
        child: Padding(
          padding: padding,
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined, size: 24, color: color),
              label: Text(
                ConstText.email,
                style: TextStyle().copyWith(color: color),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: [AutofillHints.email],
            validator: emailValidator,
          ),
        ),
      ),
    );
  }
}

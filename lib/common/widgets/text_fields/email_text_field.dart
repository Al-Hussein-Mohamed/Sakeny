import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_text.dart';
import '../../../utils/validators/validation.dart';

class EmailTextField extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final TextEditingController emailController;

  const EmailTextField({
    super.key,
    required this.padding,
    required this.emailController,
  });

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  bool isEmailValid = true;


  @override
  Widget build(BuildContext context) {
    Color color = isEmailValid ? ConstColors.lightInputField : ConstColors.lightWrongInputField;
    return  RepaintBoundary(
      child: Hero(
        tag: "email",
        child: Material(
          child: Padding(
            padding: widget.padding,
            child: TextFormField(
              controller: widget.emailController,
              decoration: InputDecoration(
                prefixIcon: RepaintBoundary(child: Icon(Icons.email_outlined, size: 24, color: color)),
                label: Text(
                  ConstText.email,
                  style: TextStyle().copyWith(color: color),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autofillHints: [AutofillHints.email],
              validator: _validateEmail,
            ),
          ),
        ),
      ),
    );
  }

  String? _validateEmail(final String? value) {
    final String? res = Validator.validateEmail(value);
    if ((res == null) != isEmailValid) {
      setState(() => isEmailValid = !isEmailValid);
    }
    return res;
  }
}

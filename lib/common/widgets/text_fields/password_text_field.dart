import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_text.dart';

class PasswordTextField extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final String label;
  final bool isPasswordObscure;
  final bool isPasswordValid;
  final TextEditingController passwordController;
  final String? Function(String?)? passwordValidator;
  final Function()? onPasswordVisibilityToggle;
  final TextInputAction? textInputAction;

  const PasswordTextField({
    super.key,
    required this.label,
    required this.padding,
    required this.isPasswordObscure,
    required this.isPasswordValid,
    required this.passwordController,
    required this.passwordValidator,
    required this.onPasswordVisibilityToggle,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    Color color = isPasswordValid ? ConstColors.lightInputField : ConstColors.lightWrongInputField;

    return Hero(
      tag: label,
      child: Material(
        child: Padding(
          padding: padding,
          child: TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline, size: 28.spMin, color: color),
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                  size: 28.spMin,
                  color: color,
                ),
                onPressed: onPasswordVisibilityToggle,
              ),
              label: Text(label, style: TextStyle().copyWith(color: color)),
            ),

            textInputAction: textInputAction,

            // TODO: modify this
            keyboardType: TextInputType.visiblePassword,
            autofillHints: [AutofillHints.password],
            obscureText: isPasswordObscure,
            validator: passwordValidator,
          ),
        ),
      ),
    );
  }
}

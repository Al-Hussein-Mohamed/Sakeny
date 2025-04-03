import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_text.dart';

class PasswordTextField extends StatelessWidget {
  final bool isPasswordObscure;
  final bool isPasswordValid;
  final TextEditingController passwordController;
  final String? Function(String?)? passwordValidator;
  final Function()? onPasswordVisibilityToggle;

  const PasswordTextField({
    super.key,
    required this.isPasswordObscure,
    required this.isPasswordValid,
    required this.passwordController,
    required this.passwordValidator,
    required this.onPasswordVisibilityToggle,
  });

  @override
  Widget build(BuildContext context) {
    Color color = isPasswordValid ? ConstColors.lightInputField : ConstColors.lightWrongInputField;

    return TextFormField(
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
        label: Text(
          ConstText.password,
          style: TextStyle().copyWith(color: color),
        ),
      ),

      // TODO: modify this
      keyboardType: TextInputType.visiblePassword,
      obscureText: isPasswordObscure,
      textInputAction: TextInputAction.done,
      validator: passwordValidator,
    );
  }
}

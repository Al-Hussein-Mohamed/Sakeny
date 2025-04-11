import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/utils/validators/validation.dart';
import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_text.dart';

class PasswordTextField extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final String label;
  final TextEditingController passwordController;
  final TextInputAction? textInputAction;

  const PasswordTextField({
    super.key,
    required this.label,
    required this.padding,
    required this.passwordController,
    this.textInputAction = TextInputAction.next,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isPasswordValid = true;
  bool isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    Color color = isPasswordValid
        ? ConstColors.lightInputField
        : ConstColors.lightWrongInputField;

    return RepaintBoundary(
      child: Hero(
        tag: widget.label,
        child: Material(
          child: Padding(
            padding: widget.padding,
            child: TextFormField(
              controller: widget.passwordController,
              decoration: InputDecoration(
                prefixIcon: RepaintBoundary(
                  child: Icon(Icons.lock_outline, size: 24, color: color),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                    size: 28.spMin,
                    color: color,
                  ),
                  onPressed: _onPasswordVisibilityToggle,
                ),
                label: Text(widget.label, style: TextStyle().copyWith(color: color)),
              ),
              textInputAction: widget.textInputAction,
              keyboardType: TextInputType.visiblePassword,
              autofillHints: [AutofillHints.password],
              obscureText: isPasswordObscure,
              validator: _passwordValidator,
            ),
          ),
        ),
      ),
    );
  }

  String? _passwordValidator(final String? value) {
    final String? res = Validator.validatePassword(value);
    if ((res == null) != isPasswordValid) {
      setState(() => isPasswordValid = !isPasswordValid);
    }
    return res;
  }

  void _onPasswordVisibilityToggle() {
    setState(() => isPasswordObscure = !isPasswordObscure);
  }
}

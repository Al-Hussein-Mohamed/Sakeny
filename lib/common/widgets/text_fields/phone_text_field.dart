import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/utils/validators/validation.dart';
import '../../../utils/constants/const_colors.dart';

class PhoneTextField extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final String label;
  final TextEditingController phoneController;

  const PhoneTextField({
    super.key,
    required this.padding,
    required this.label,
    required this.phoneController,
  });

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  bool isPhoneValid = true;

  @override
  Widget build(BuildContext context) {
    Color color = isPhoneValid ? ConstColors.lightInputField : ConstColors.lightWrongInputField;
    return RepaintBoundary(
      child: Padding(
        padding: widget.padding,
        child: TextFormField(
          controller: widget.phoneController,
          decoration: InputDecoration(
            prefixIcon: RepaintBoundary(
              child: Icon(Icons.phone_outlined, size: 24, color: color),
            ),
            label: Text(
              widget.label,
              style: TextStyle().copyWith(color: color),
            ),
          ),
          textInputAction: TextInputAction.next,
          autofillHints: [AutofillHints.telephoneNumber],
          keyboardType: TextInputType.phone,
          validator: _validatePhone,
        ),
      ),
    );
  }

  String? _validatePhone(final String? value) {
    final String? res = Validator.validatePhoneNumber(value);
    if ((res == null) != isPhoneValid) {
      setState(() => isPhoneValid = !isPhoneValid);
    }
    return res;
  }
}

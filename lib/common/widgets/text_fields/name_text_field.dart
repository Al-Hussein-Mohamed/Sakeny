import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "../../../utils/constants/const_colors.dart";

class NameTextField extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final String label;
  final bool isNameValid;
  final String? Function(String?)? nameValidator;
  final TextEditingController nameController;

  const NameTextField({
    super.key,
    required this.padding,
    required this.label,
    required this.isNameValid,
    required this.nameController,
    required this.nameValidator,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isNameValid ? ConstColors.lightInputField : ConstColors.lightWrongInputField;
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_outline_rounded, size: 24, color: color),
          label: Text(
            label,
            style: TextStyle().copyWith(color: color),
          ),
        ),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        validator: nameValidator,
      ),
    );
  }
}

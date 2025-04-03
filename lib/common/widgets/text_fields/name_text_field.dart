import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "../../../utils/constants/const_colors.dart";

class NameTextField extends StatelessWidget {
  final String label;
  final bool isNameValid;
  final String? Function(String?)? nameValidator;
  final TextEditingController nameController;

  const NameTextField({
    super.key,
    required this.label,
    required this.isNameValid,
    required this.nameController,
    required this.nameValidator,
  });

  @override
  Widget build(BuildContext context) {
    Color color = isNameValid ? ConstColors.lightInputField : ConstColors.lightWrongInputField;
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline_rounded, size: 28.spMin, color: color),
        label: Text(
          label,
          style: TextStyle().copyWith(color: color),
        ),
      ),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      validator: nameValidator,
    );
  }
}

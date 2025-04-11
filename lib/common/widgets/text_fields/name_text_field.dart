import 'package:flutter/material.dart';
import 'package:sakeny/utils/validators/validation.dart';
import '../../../utils/constants/const_colors.dart';

class NameTextField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String label;
  final TextEditingController nameController;

  const NameTextField({
    super.key,
    this.padding = const EdgeInsets.all(0),
    required this.label,
    required this.nameController,
  });

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  bool isNameValid = true;

  @override
  Widget build(BuildContext context) {
    final Color color = isNameValid ? ConstColors.lightInputField : ConstColors.lightWrongInputField;
    return Padding(
      padding: widget.padding!,
      child: TextFormField(
        controller: widget.nameController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person_outline_rounded, size: 24, color: color),
          label: Text(widget.label, style: TextStyle().copyWith(color: color)),
        ),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        validator: _validateName,
      ),
    );
  }

  String? _validateName(final String? value) {
    final res = Validator.validateName(value);
    if ((res == null) != isNameValid) {
      setState(() => isNameValid = !isNameValid);
    }
    return res;
  }
}

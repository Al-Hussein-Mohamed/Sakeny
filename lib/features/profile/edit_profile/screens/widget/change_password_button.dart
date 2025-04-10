import 'package:flutter/material.dart';
import 'package:sakeny/utils/constants/const_colors.dart';
import 'package:sakeny/utils/constants/const_text.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstColors.primaryColor.withAlpha(210),
      ),
      child: const Text(ConstText.changePassword),
    );
  }
}

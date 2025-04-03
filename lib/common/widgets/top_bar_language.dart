import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'language_dropdown.dart';

class TopBarLanguage extends StatelessWidget {
  final void Function() function;
  final IconData icon;

  const TopBarLanguage({
    super.key,
    required this.function,
    this.icon = Icons.arrow_back_ios_new,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "top-bar",
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 18.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: function,
              icon: Icon(icon, size: 28.spMin),
            ),
            const LanguageDropdown(),
          ],
        ),
      ),
    );
  }
}

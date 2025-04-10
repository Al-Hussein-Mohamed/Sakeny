import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/utils/constants/dist.dart';

import 'language_dropdown.dart';

class TopBarLanguage extends StatelessWidget {
  final void Function() function;
  final IconData icon;
  final EdgeInsets? padding;

  const TopBarLanguage({
    super.key,
    required this.function,
    this.padding,
    this.icon = Icons.arrow_back_ios_new,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "top-bar",
      child: RPadding(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: Dist.screenHorizontalPadding,
              vertical: Dist.screenVerticalPadding,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: function,
              icon: Icon(icon, size: Dist.iconSize),
            ),
            const LanguageDropdown(),
          ],
        ),
      ),
    );
  }
}

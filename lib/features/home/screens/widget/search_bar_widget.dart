import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_images.dart';
import '../../../../utils/constants/const_text.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Hero(
      tag: "auth-button",
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10.r),
        child: TextField(
          decoration: InputDecoration(
            hintText: ConstText.searchHint,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(color: ConstColors.lightTextTitle),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(ConstImages.searchLogo),
            ),
            suffixIcon: InkWell(
              onTap: ()=> print("searchFilter"),
              child: Container(
                margin: EdgeInsets.only(right: 6.5, left: 3.5 ,top: 5.5, bottom: 2.5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ConstColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(ConstImages.searchSettings),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.circular(10.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 2.0),
              borderRadius: BorderRadius.circular(10.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ConstColors.lightWrongInputField, width: 2.0),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ConstColors.lightWrongInputField, width: 2.0),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ),
    );
  }
}

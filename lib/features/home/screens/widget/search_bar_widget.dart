import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sakeny/features/home/controllers/home_cubit.dart';

import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_images.dart';
import '../../../../utils/constants/const_text.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.read<HomeCubit>();
    var theme = Theme.of(context);
    return Positioned(
      top: homeCubit.searchBarTopOffset,
      left: homeCubit.searchBarLeftOffset,
      child: Hero(
        tag: "button",
        child: Material(
          elevation: 8.0,
          borderRadius: BorderRadius.circular(10.r),
          child: SizedBox(
            height: homeCubit.searchBarHeight,
            width: homeCubit.searchBarWidth,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: ConstText.searchHint,
                  hintStyle:
                      theme.textTheme.bodyMedium?.copyWith(color: ConstColors.lightTextTitle),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(ConstImages.searchLogo),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () => print("searchFilter"),
                    child: Container(
                      margin: EdgeInsets.only(right: 6.5, left: 3.5, top: 5.5, bottom: 2.5),
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
                    borderSide:
                        const BorderSide(color: ConstColors.lightWrongInputField, width: 2.0),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: ConstColors.lightWrongInputField, width: 2.0),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

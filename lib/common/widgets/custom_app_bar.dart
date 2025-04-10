import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sakeny/core/routing/page_route_name.dart';

import '../../core/services/service_locator.dart';
import '../../features/home/controllers/home_cubit.dart';
import '../../utils/constants/const_colors.dart';
import '../../utils/constants/const_images.dart';

class CustomAppBar {
  static AppBar buildAppBar({
    required BuildContext context,
    required String title,
    required Function() openDrawer,
    Function()? onBack,
  }) {
    return AppBar(
      toolbarHeight: 70.h,
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => onBack ?? Navigator.pushReplacementNamed(context, PageRouteNames.home),
      ),
      title: Text(title),
      actions: [
        Hero(
          tag: "drawerIcon",
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            onTap: openDrawer,
            child: Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(ConstImages.drawerIcon),
              // child: Image.asset(ConstImages.drawerIconPng),
            ),
          ),
        ),
      ],
    );
  }
}

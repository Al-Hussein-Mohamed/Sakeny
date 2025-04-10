import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../core/services/service_locator.dart";
import "../../../../utils/constants/const_colors.dart";
import "../../../../utils/constants/const_images.dart";
import "../../controllers/home_cubit.dart";

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Positioned(
      top: 50.h,
      right: 0,
      child: Hero(
        tag: "drawerIcon",
        child: InkWell(
          onTap: () => homeCubit.scaffoldKey.currentState?.openEndDrawer(),
          child: Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ConstColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
            ),

            child: SvgPicture.asset(ConstImages.drawerIcon),
            // child: Image.asset(ConstImages.drawerIconPng),
          ),
        ),
      ),
    );
  }
}

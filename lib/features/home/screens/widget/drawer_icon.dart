import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

import "../../../../utils/constants/const_colors.dart";
import "../../../../utils/constants/const_images.dart";
import "../../controllers/home_cubit.dart";

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Positioned(
      top: homeCubit.drawerIconTopOffset,
      right: 0,
      child: Material(
        elevation: 8,
        color: ConstColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: Hero(
          tag: "drawerIcon",
          child: InkWell(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            onTap: () => homeCubit.scaffoldKey.currentState?.openEndDrawer(),
            child: Container(
              width: homeCubit.drawerIconHeight,
              height: homeCubit.drawerIconHeight,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),

              child: SvgPicture.asset(ConstImages.drawerIcon),
              // child: Image.asset(ConstImages.drawerIconPng),
            ),
          ),
        ),
      ),
    );
  }
}

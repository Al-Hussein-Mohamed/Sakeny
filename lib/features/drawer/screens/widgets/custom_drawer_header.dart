import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routing/page_route_name.dart';
import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_images.dart';
import '../../../home/controllers/home_cubit.dart';
import '../../../home/controllers/home_cubit.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Set<String> blackList = {
      PageRouteNames.editProfile,
      PageRouteNames.profile,
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => _onEditProfileTap(context),
                  child: Hero(
                    tag: blackList.contains(ModalRoute.of(context)?.settings.name)
                        ? "blah blah"
                        : "profilePic",
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: theme.scaffoldBackgroundColor,
                      child: Image.asset(
                        ConstImages.profilePic,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mohammed Ali",
                          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
                      SizedBox(height: 3),
                      Text("+2012 0000 0000",
                          style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w300)),
                      SizedBox(height: 3),
                      Text("email@gmail.com",
                          style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w300)),
                      SizedBox(height: 3),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Material(
              color: ConstColors.drawerButton,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              child: InkWell(
                onTap: () => _onEditProfileTap(context),
                borderRadius: BorderRadius.circular(10.r),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(ConstImages.drawerEditProfile),
                      SizedBox(width: 5),
                      Text(
                        "Edit Profile",
                        style: TextStyle().copyWith(
                          color: Colors.white,
                          fontSize: 11.spMin,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onEditProfileTap(BuildContext context) {
    Navigator.pop(context);

    if (ModalRoute.of(context)?.settings.name == PageRouteNames.editProfile) {
      return;
    }

    Navigator.pushReplacementNamed(context, PageRouteNames.editProfile);
  }
}

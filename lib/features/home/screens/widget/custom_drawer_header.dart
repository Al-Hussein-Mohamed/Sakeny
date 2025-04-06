import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_images.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: theme.scaffoldBackgroundColor,
                child: Image.asset(
                  ConstImages.profilePic,
                  fit: BoxFit.cover,
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
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: ConstColors.drawerButton,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(ConstImages.drawerEditProfile),
                    SizedBox(width: 5),
                    Text("Edit Profile",
                        style: TextStyle().copyWith(
                          color: Colors.white,
                          fontSize: 11.spMin,
                          fontWeight: FontWeight.w400,
                        ))
                  ],
                )),
          ),
        )
      ],
    );
  }
}

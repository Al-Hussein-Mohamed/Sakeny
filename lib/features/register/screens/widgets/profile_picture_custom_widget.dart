import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "../../../../utils/constants/const_images.dart";
import "../../../../utils/constants/const_text.dart";

class ProfilePictureCustomWidget extends StatelessWidget {
  const ProfilePictureCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Hero(
      tag: "img",
      child: FittedBox(
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 65,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  child: Image.asset(
                    ConstImages.profilePic,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      size: 20,
                      color: theme.scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(ConstText.registerTitle, style: theme.textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}

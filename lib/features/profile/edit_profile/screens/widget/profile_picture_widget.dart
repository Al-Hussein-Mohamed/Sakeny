import 'package:flutter/material.dart';
import 'package:sakeny/utils/constants/const_images.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Hero(
      tag: "profilePic",
      child: Center(
        child: Stack(
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
      ),
    );
  }
}
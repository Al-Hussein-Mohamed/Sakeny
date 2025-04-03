import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:sakeny/utils/constants/const_images.dart";

import "../../models/sing_in_card_model.dart";

class SignInCardWidget extends StatelessWidget {
  final SignInCardModel signInCardModel;
  const SignInCardWidget({super.key, required this.signInCardModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.r),
        child: InkWell(
          onTap: signInCardModel.onTap,
          borderRadius: BorderRadius.circular(15.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.r),
            decoration: BoxDecoration(
              color: signInCardModel.backgroundColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.asset(signInCardModel.image, width: 25.r, height: 25.r,)
          ),
        ),
      ),
    );
  }
}

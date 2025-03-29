
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingCustomPage extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const OnboardingCustomPage(
      {super.key, required this.image, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          image,
          width: MediaQuery.of(context).size.width * .9,
        ),
        SizedBox(height: 40.h,),
        Text(
          title,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
            shadows: [
              const Shadow(
                color: Colors.black38,
                offset: Offset(0, 3),
                blurRadius: 10,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

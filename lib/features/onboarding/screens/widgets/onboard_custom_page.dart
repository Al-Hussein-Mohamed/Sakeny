import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/onboarding_model.dart';

class OnboardingCustomPage extends StatelessWidget {
  final OnboardingModel onboardingModel;

  const OnboardingCustomPage({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(onboardingModel.image, width: 300.w),
        SizedBox(height: 10.h),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            onboardingModel.title,
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
        ),
        RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            onboardingModel.description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

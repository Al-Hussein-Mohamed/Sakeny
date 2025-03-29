import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../utils/constants/const_colors.dart';
import '../../controllers/onboarding_cubit.dart';

class OnboardingDotNavigation extends StatelessWidget {

  const OnboardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingCubit onboardingCubit = context.read<OnboardingCubit>();
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(30.h),
          child: Center(
            child: SmoothPageIndicator(
              controller: (onboardingCubit.pageController),
              onDotClicked: (onboardingCubit.navigationChangePage),
              count: 3,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  color: ConstColors.primaryColor,
                  height: 20.r,
                  width: 50.r,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                dotDecoration: DotDecoration(
                  color: Colors.transparent,
                  height: 20.r,
                  width: 28.r,
                  borderRadius: BorderRadius.circular(10.r),
                  dotBorder: DotBorder(
                    color: ConstColors.primaryColor,
                    width: 2.2.r,
                  ),
                ),
                spacing: 10.r, // Spacing between dots
              ),
            ),
          ),
        );
      },
    );
  }
}

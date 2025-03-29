import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/page_route_name.dart';
import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_text.dart';
import '../../controllers/onboarding_cubit.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final bool isLastPage = onboardingCubit.currentPage == onboardingCubit.pages.length - 1;
        final Color buttonColor =
            isLastPage ? ConstColors.secondaryColor : ConstColors.primaryColor;
        final String buttonText =
            isLastPage ? ConstText.onboardingButtonText2 : ConstText.onboardingButtonText1;

        return Hero(
          tag: "auth-button",
          flightShuttleBuilder: (
              BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext,
              ) {
            // Wrap the widget in a ScaleTransition that uses an easeInOut curve.
            return ScaleTransition(
              scale: animation.drive(CurveTween(curve: Curves.easeInOut)),
              child: flightDirection == HeroFlightDirection.push
                  ? toHeroContext.widget
                  : fromHeroContext.widget,
            );
          },
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ElevatedButton(
                onPressed:
                    isLastPage ? ()=> onboardingCubit.exit(context) : onboardingCubit.nextPage,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  shadowColor: WidgetStateProperty.all(Colors.transparent),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
                child: Text(buttonText),
              ),
            ),
          ),
        );
      },
    );
  }
}

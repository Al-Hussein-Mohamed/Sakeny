import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/page_route_name.dart';
import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_text.dart';
import '../../controllers/onboarding_cubit.dart';
import '../../models/onboarding_model.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final bool isLastPage = onboardingCubit.currentPage == onboardingList.length - 1;
        final Color buttonColor =
            isLastPage ? ConstColors.secondaryColor : ConstColors.primaryColor;
        final String buttonText =
            isLastPage ? ConstText.onboardingButtonText2 : ConstText.onboardingButtonText1;

        return Hero(
          tag: "auth-button",
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/features/onboarding/models/onboarding_model.dart';
import 'package:sakeny/features/onboarding/models/onboarding_model.dart';
import 'package:sakeny/features/onboarding/screens/widgets/language_dropdown.dart';
import 'package:sakeny/features/onboarding/screens/widgets/onboard_custom_page.dart';
import 'package:sakeny/features/onboarding/screens/widgets/onboarding_button.dart';
import 'package:sakeny/features/onboarding/screens/widgets/onboarding_dot_navigation.dart';
import 'package:sakeny/utils/constants/const_images.dart';
import 'package:sakeny/utils/constants/const_text.dart';

import '../../../core/services/service_locator.dart';
import '../controllers/onboarding_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const OnboardingBody(),
    );
  }
}

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingCubit onboardingCubit = context.read<OnboardingCubit>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0.r),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => onboardingCubit.exit(context),
                        icon: Icon(Icons.close, size: 24.spMin)),
                    const LanguageDropdown(),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: PageView.builder(
                  controller: onboardingCubit.pageController,
                  onPageChanged: onboardingCubit.changePage,
                  itemCount: onboardingList.length,
                  itemBuilder: (context, index) => Center(
                    child: SingleChildScrollView(
                      child: OnboardingCustomPage(
                        onboardingModel: onboardingList[index],
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(child: OnboardingDotNavigation()),
              const OnboardingButton(),
            ],
          ),
        ),
      ),
    );
  }
}

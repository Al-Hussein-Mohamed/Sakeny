import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/common/widgets/custom_pop_scope.dart';
import 'package:sakeny/common/widgets/top_bar_language.dart';
import 'package:sakeny/features/onboarding/models/onboarding_model.dart';
import 'package:sakeny/features/onboarding/models/onboarding_model.dart';
import 'package:sakeny/common/widgets/language_dropdown.dart';
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
    final OnboardingCubit onboardingCubit = context.read<OnboardingCubit>();
    final theme = Theme.of(context);
    return CustomPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              TopBarLanguage(
                icon: Icons.close,
                function: () => onboardingCubit.exit(context),
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

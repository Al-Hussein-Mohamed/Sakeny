import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/common/widgets/custom_pop_scope.dart';
import 'package:sakeny/common/widgets/custom_scaffold.dart';
import 'package:sakeny/common/widgets/top_bar_language.dart';
import 'package:sakeny/features/onboarding/models/onboarding_model.dart';
import 'package:sakeny/features/onboarding/screens/widgets/onboard_custom_page.dart';
import 'package:sakeny/features/onboarding/screens/widgets/onboarding_button.dart';
import 'package:sakeny/features/onboarding/screens/widgets/onboarding_dot_navigation.dart';

import '../controllers/onboarding_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingCubit onboardingCubit = context.read<OnboardingCubit>();

    return CustomPopScope(
      child: CustomScaffold(
        body: SafeArea(
          child: Column(
            children: [
              /// AppBar
              TopBarLanguage(
                icon: Icons.close,
                function: () => onboardingCubit.exit(context),
              ),

              /// Onboarding Pages
              Expanded(
                flex: 7,
                child: PageView.builder(
                  controller: onboardingCubit.pageController,
                  onPageChanged: onboardingCubit.changePage,
                  itemCount: onboardingList.length,
                  itemBuilder: (context, index) =>
                      OnboardingCustomPage(onboardingModel: onboardingList[index]),
                ),
              ),

              /// Onboarding Dot Navigation
              const Expanded(child: OnboardingDotNavigation()),

              /// Onboarding Button
              const OnboardingButton(),
            ],
          ),
        ),
      ),
    );
  }
}

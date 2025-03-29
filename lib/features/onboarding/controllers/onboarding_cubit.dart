import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../core/config/page_route_name.dart';
import '../../../utils/constants/const_images.dart';
import '../../../utils/constants/const_text.dart';
import '../screens/widgets/onboard_custom_page.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  final List<OnboardingCustomPage> pages = const [
    OnboardingCustomPage(
      image: ConstImages.onboarding1,
      title: ConstText.onboardingTitle1,
      subTitle: ConstText.onboardingSubTitle1,
    ),
    OnboardingCustomPage(
      image: ConstImages.onboarding2,
      title: ConstText.onboardingTitle2,
      subTitle: ConstText.onboardingSubTitle2,
    ),
    OnboardingCustomPage(
      image: ConstImages.onboarding3,
      title: ConstText.onboardingTitle3,
      subTitle: ConstText.onboardingSubTitle3,
    ),
  ];

  int currentPage = 0;
  final pageController = PageController();

  void changePage(int index) {
    currentPage = index;
    emit(OnboardingInitial());
  }

  void navigationChangePage(int index) {
    currentPage = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    emit(OnboardingInitial());
  }

  void nextPage() {
    if (currentPage == pages.length - 1) return;
    currentPage++;
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    emit(OnboardingInitial());
  }

  void exit(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      PageRouteNames.login,
      (route) => false,
    );
  }
}

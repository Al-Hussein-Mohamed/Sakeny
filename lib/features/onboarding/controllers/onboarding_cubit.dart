import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../core/config/page_route_name.dart';
import '../../../utils/constants/const_images.dart';
import '../../../utils/constants/const_text.dart';
import '../models/onboarding_model.dart';
import '../screens/widgets/onboard_custom_page.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());


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
    if (currentPage == onboardingList.length - 1) return;
    currentPage++;
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    emit(OnboardingInitial());
  }

  void exit(BuildContext context) {
    Navigator.pushNamed(
      context,
      PageRouteNames.login,
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      currentPage = 0;
      pageController.jumpToPage(currentPage);
    });
  }
}

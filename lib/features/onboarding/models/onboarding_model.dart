import 'package:sakeny/utils/constants/const_text.dart';

import '../../../utils/constants/const_images.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    image: ConstImages.onboarding1,
    title: ConstText.onboardingTitle1,
    description: ConstText.onboardingSubTitle1,
  ),
  OnboardingModel(
    image: ConstImages.onboarding2,
    title: ConstText.onboardingTitle2,
    description: ConstText.onboardingSubTitle2,
  ),
  OnboardingModel(
    image: ConstImages.onboarding3,
    title: ConstText.onboardingTitle3,
    description: ConstText.onboardingSubTitle3,
  ),
];

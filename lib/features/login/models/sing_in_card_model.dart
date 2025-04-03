import 'dart:ui';

import 'package:sakeny/features/login/screens/widgets/sign_in_card_widget.dart';

import '../../../utils/constants/const_images.dart';

class SignInCardModel{
  final String image;
  final Color backgroundColor;
  final void Function()? onTap;

  SignInCardModel({
    required this.image,
    required this.backgroundColor,
    required this.onTap,
  });
}

List<SignInCardModel> signInCards = [
  SignInCardModel(
    image: ConstImages.googleIcon,
    backgroundColor: const Color(0xFFFEF5F4),
    onTap: () {},
  ),
  SignInCardModel(
    image: ConstImages.facebookIcon,
    backgroundColor: const Color(0xFFF3F8FE),
    onTap: () {},
  ),
  SignInCardModel(
    image: ConstImages.microsoftIcon,
    backgroundColor: const Color(0xFFF5FAF6),
    onTap: () {},
  ),
];



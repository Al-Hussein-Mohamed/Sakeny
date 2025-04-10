import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/core/routing/page_route_name.dart';
import 'package:sakeny/features/home/controllers/home_cubit.dart';
import 'package:sakeny/features/home/screens/home_screen.dart';
import 'package:sakeny/features/profile/edit_profile/controllers/edit_profile_cubit.dart';
import 'package:sakeny/features/profile/edit_profile/screens/edit_profile_screen.dart';
import 'package:sakeny/features/register/screens/register_screen.dart';

import '../../features/login/controllers/login_cubit.dart';
import '../../features/login/screens/login_screen.dart';
import '../../features/onboarding/controllers/onboarding_cubit.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/register/controllers/register_cubit.dart';
import '../services/service_locator.dart';

class PageRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.onboarding:
        return CustomMaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OnboardingCubit(),
            child: const OnboardingScreen(),
          ),
          settings: settings,
        );

      case PageRouteNames.login:
        return CustomMaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
          settings: settings,
        );

      case PageRouteNames.register:
        return CustomMaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterScreen(),
          ),
          settings: settings,
        );

      case PageRouteNames.home:
        return CustomMaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(),
            child: HomeScreen(),
          ),
          settings: settings,
        );

      case PageRouteNames.editProfile:
        return CustomMaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => EditProfileCubit(),
              child: EditProfileScreen(),
            ),
          settings: settings,
        );

      default:
        return CustomMaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
    }
  }
}

class CustomMaterialPageRoute<T> extends MaterialPageRoute<T> {
  static const int customDuration = 450;
  final Duration customTransitionDuration;
  final Duration customReverseTransitionDuration;

  CustomMaterialPageRoute({
    required super.builder,
    required super.settings,
    this.customTransitionDuration = const Duration(milliseconds: customDuration),
    this.customReverseTransitionDuration = const Duration(milliseconds: customDuration),
  });

  @override
  Duration get transitionDuration => customTransitionDuration;

  @override
  Duration get reverseTransitionDuration => customReverseTransitionDuration;
}

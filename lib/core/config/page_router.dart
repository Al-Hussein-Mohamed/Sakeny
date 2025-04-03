import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/core/config/page_route_name.dart';
import 'package:sakeny/features/home/screens/home_screen.dart';
import 'package:sakeny/features/register/screens/register_screen.dart';

import '../../features/login/controllers/login_cubit.dart';
import '../../features/login/screens/login_screen.dart';
import '../../features/onboarding/controllers/onboarding_cubit.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/register/controllers/register_cubit.dart';

class PageRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.onboarding:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OnboardingCubit(),
            child: const OnboardingScreen(),
          ),
          settings: settings,
        );

      case PageRouteNames.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
          settings: settings,
        );

      case PageRouteNames.register:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterScreen(),
          ),
          settings: settings,
        );

      case PageRouteNames.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Placeholder(),
          settings: settings,
        );
    }
  }
}

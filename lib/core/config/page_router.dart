import 'package:flutter/material.dart';
import 'package:sakeny/core/config/page_route_name.dart';

import '../../features/login/screens/login_screen.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';

class PageRouter {
  static  Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch (settings.name){
      case PageRouteNames.onboarding:
        return PageRouteBuilder(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 400), // Custom duration
          pageBuilder: (context, animation, secondaryAnimation) => const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Example: Fade transition with Hero animations working automatically
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

      case PageRouteNames.login:
        return PageRouteBuilder(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 400), // Custom duration
          pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Example: Fade transition with Hero animations working automatically
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );


      default:
        return MaterialPageRoute(
          builder: (context) => const Placeholder(),
          settings: settings,
        );
    }
  }
}
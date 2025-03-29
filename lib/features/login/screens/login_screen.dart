import 'package:flutter/material.dart';

import '../../../core/config/page_route_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                PageRouteNames.onboarding,
                (route) => false,
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Hero(
          tag: "auth-button",
          flightShuttleBuilder: (
              BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext,
              ) {
            // Wrap the widget in a ScaleTransition that uses an easeInOut curve.
            return ScaleTransition(
              scale: animation.drive(CurveTween(curve: Curves.easeInOut)),
              child: flightDirection == HeroFlightDirection.push
                  ? toHeroContext.widget
                  : fromHeroContext.widget,
            );
          },
          child: Center(
            child: ElevatedButton(onPressed: () {}, child: Text("login")),
          ),
        ));
  }
}

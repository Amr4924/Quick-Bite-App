import 'package:flutter/material.dart';
import 'package:quick_bite/core/routing/router.dart';
import 'package:quick_bite/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text("No Routes defined for ${settings.name}"),
              ),
            );
          },
        );
    }
  }
}

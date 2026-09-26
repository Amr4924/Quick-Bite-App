import 'package:flutter/material.dart';
import 'package:quick_bite/core/routing/router.dart';
import 'package:quick_bite/features/auth/auth_screen.dart';
import 'package:quick_bite/features/home/data/product_model.dart';
import 'package:quick_bite/features/home/ui/home_screen.dart';
import 'package:quick_bite/features/onboarding/onboarding_screen.dart';
import 'package:quick_bite/features/product_details/ui/product_details_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final argumentsitem = settings.arguments;
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.authScreen:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.productDetails:
        return MaterialPageRoute(
          builder: (_) => ProductDetails(item: argumentsitem as ProductModel),
        );
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

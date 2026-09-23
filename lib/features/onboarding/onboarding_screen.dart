import 'package:flutter/material.dart';
import 'package:quick_bite/features/onboarding/widgets/content.dart';
import 'package:quick_bite/features/onboarding/widgets/herro.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [Herro(), Content()]),
      ),
    );
  }
}

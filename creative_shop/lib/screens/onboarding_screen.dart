import 'package:creative_shop/shared/component.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageViewScreen(context, image: '1.jpg'),
    );
  }
}

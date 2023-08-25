import 'package:creative_shop/screens/home.dart';
import 'package:creative_shop/shared/constant.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  double opacity = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => setState(() {
        opacity = 1;
      }),
    );
    Future.delayed(
      const Duration(milliseconds: 3000),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          if (login) return const Home();
          return const OnboardingScreen();
        }),
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 900),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Image.asset('asset/images/logo-no-background.png'),
          ),
        ),
      ),
    );
  }
}

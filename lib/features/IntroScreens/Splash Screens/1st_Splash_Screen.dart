import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/IntroScreens/Splash%20Screens/2nd_Splash_Screen.dart';

class FirstSplashScreen extends StatefulWidget {
  const FirstSplashScreen({super.key});

  @override
  State<FirstSplashScreen> createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 100), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: const SecondSplashScreen(),
              type: PageTransitionType.scale,
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 800)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palate.primaryColor,
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/IntroScreens/Introduction%20Screens/intro_Screens_items.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          PageTransition(
            child: IntroScreensItems(),
            duration: Duration(seconds: 1),
            type: PageTransitionType.fade,
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palate.primaryColor,
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          child: SvgPicture.asset(
            "assets/images/Logo1.svg",
          ),
        ),
      ),
    );
  }
}

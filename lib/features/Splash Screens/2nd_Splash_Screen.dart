import 'dart:async';

import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/Introduction%20Screens/intro_Screens_items.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 2),
        () => Flexify.go(IntroScreensItems(),
            animation: FlexifyRouteAnimations.fade,
            animationDuration: Duration(seconds: 1)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palate.primaryColor,
      body: Center(
        child:  Container(
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

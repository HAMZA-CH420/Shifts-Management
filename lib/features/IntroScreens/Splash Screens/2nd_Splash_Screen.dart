import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/AuthenticationScreens/Login%20Screen/Login_Screen.dart';
import 'package:shifts_management/features/Bottom%20NavBar/Bottom_navBar.dart';
import 'package:shifts_management/features/IntroScreens/Introduction%20Screens/intro_Screens_items.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  void initState() {
    isLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palate.primaryColor,
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: SvgPicture.asset(
            "assets/images/Logo1.svg",
          ),
        ),
      ),
    );
  }

  Future<void> isLoggedIn() async {
    var pref = await SharedPreferences.getInstance();
    bool isLoggedIn = pref.getBool("isLoggedIn") ?? true;
    Timer(const Duration(milliseconds: 800), () {
      if (isLoggedIn) {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: const IntroScreensItems(),
                type: PageTransitionType.fade));
      } else {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: StreamBuilder(
                  stream: FirebaseAuth.instance.idTokenChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.data != null) {
                      return const BottomNavbar();
                    } else {
                      return const LoginScreen();
                    }
                  },
                ),
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 200)));
      }
    });
  }
}

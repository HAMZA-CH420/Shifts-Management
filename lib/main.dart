import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/App_Theme.dart';
import 'package:shifts_management/features/AuthenticationScreens/Login%20Screen/Login_Screen.dart';
import 'package:shifts_management/features/Bottom%20NavBar/Bottom_navBar.dart';
import 'package:shifts_management/features/HomeScreen/Chat_HomePage.dart';
import 'package:shifts_management/features/IntroScreens/Splash%20Screens/1st_Splash_Screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Flexify(
      designHeight: 375,
      designWidth: 812,
      app:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shifts Management',
        theme: AppTheme.lightTheme,
        home: BottomNavbar(),
      ),
    );
  }
}

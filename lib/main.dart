import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/App_Theme.dart';
import 'package:shifts_management/features/%20Profile%20Screen/Profile_Screen.dart';


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
        home: ProfileScreen(),
      ),
    );
  }
}

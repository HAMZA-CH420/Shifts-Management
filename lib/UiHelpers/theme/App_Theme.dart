import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColorLight: Color(0xffF4F4F4),
    bottomSheetTheme: BottomSheetThemeData(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
    ),);
}

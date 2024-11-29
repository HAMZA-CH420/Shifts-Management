import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColorLight: Color(0xffF4F4F4),
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    bottomSheetTheme: BottomSheetThemeData(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
    ),
  );
}

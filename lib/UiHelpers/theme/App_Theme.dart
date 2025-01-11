import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColorLight: const Color(0xffF4F4F4),
    bottomSheetTheme: const BottomSheetThemeData(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
    ),
  );
}

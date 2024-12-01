import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomShiftIcon extends StatelessWidget {
  CustomShiftIcon({super.key, required this.icon});
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: Palate.navBarColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: icon,
      ),
    );
  }
}

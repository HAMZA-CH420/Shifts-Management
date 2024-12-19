import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomButtonShift extends StatelessWidget {
  const CustomButtonShift({
    super.key,
    required this.btnName,
    this.color = Palate.primaryColor,
    this.bgColor = Colors.transparent,
    required this.onTap,
  });
  final String btnName;
  final Color color, bgColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Palate.primaryColor)),
        fixedSize: Size(370, 50),
        backgroundColor: bgColor,
      ),
      onPressed: onTap,
      child: Text(
        btnName,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }
}

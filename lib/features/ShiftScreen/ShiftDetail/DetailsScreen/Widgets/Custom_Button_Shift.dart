import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomButtonShift extends StatelessWidget {
  const CustomButtonShift({
    super.key,
    required this.btnName,
    this.color = Palate.primaryColor,
    this.bgColor = Colors.transparent,
  });
  final String btnName;
  final Color color, bgColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Palate.primaryColor)),
        fixedSize: Size(370, 50),
        backgroundColor: bgColor,
      ),
      onPressed: () {},
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

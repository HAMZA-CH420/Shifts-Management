import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomDateBox extends StatelessWidget {
  const CustomDateBox({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.2,
      child: Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Palate.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Palate.textFieldTextColor,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}

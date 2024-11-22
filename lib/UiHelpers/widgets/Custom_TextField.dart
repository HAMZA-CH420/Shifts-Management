import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield(
      {super.key,
      required this.labelText,
      required this.controller,
      this.isHidden = false});

  final String labelText;
  final TextEditingController controller;
  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(7),
      elevation: 1.5,
      child: Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: controller,
            obscureText: isHidden,
            style: TextStyle(
                color: Palate.TextFieldTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: TextStyle(color: Palate.labelColor),
              labelText: labelText,
            ),
          ),
        ),
      ),
    );
  }
}

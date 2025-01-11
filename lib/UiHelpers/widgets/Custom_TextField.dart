import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.labelText,
      required this.controller,
      this.isHidden = false,
      this.suffixText = "",
      this.validator});

  final String labelText;
  final TextEditingController controller;
  final bool isHidden;
  final String suffixText;
  final FormFieldValidator? validator;
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
            validator: validator,
            controller: controller,
            obscureText: isHidden,
            style: const TextStyle(
                color: Palate.TextFieldTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              suffixText: suffixText,
              suffixStyle: const TextStyle(color: Colors.green, fontSize: 12),
              border: InputBorder.none,
              labelStyle: const TextStyle(color: Palate.labelColor),
              labelText: labelText,
            ),
          ),
        ),
      ),
    );
  }
}

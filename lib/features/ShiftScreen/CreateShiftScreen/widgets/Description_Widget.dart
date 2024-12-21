import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class DescriptionWidget extends StatelessWidget {
  DescriptionWidget({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 200,
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "write Description(Optional)",
            hintStyle:
                TextStyle(color: Palate.shiftTileBannerColor, fontSize: 15),
          ),
        ),
      ),
    );
  }
}

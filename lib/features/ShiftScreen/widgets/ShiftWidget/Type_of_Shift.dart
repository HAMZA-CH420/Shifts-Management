import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Custom_Shift_Icon.dart';

class TypeOfShift extends StatelessWidget {
  TypeOfShift({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomShiftIcon(
            icon: const ImageIcon(
          AssetImage("assets/icons/Type.png"),
          color: Palate.primaryColor,
        )),
        Text(
          category,
          style: const TextStyle(
              color: Palate.shiftTextColorSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

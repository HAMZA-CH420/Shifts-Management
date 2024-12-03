import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/TabBar/Custom_Shift_Icon.dart';

class TypeOfShift extends StatelessWidget {
  const TypeOfShift({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomShiftIcon(
            icon: ImageIcon(
          AssetImage("assets/icons/Type.png"),
          color: Palate.primaryColor,
        )),
        Text(
          "Plumber",
          style: TextStyle(
              color: Palate.shiftTextColorSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

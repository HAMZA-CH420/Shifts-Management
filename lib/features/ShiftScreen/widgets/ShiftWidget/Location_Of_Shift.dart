import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Custom_Shift_Icon.dart';

class LocationOfShift extends StatelessWidget {
  const LocationOfShift({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomShiftIcon(
            icon: Icon(
          Icons.location_on_rounded,
          color: Palate.primaryColor,
        )),
        Text(
          "30 Ulomogo Street, Toongi",
          style: TextStyle(
              color: Palate.shiftTextColorSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Custom_Shift_Icon.dart';

class LocationOfShift extends StatelessWidget {
  LocationOfShift({super.key, required this.location});
  final String location;
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
          location,
          style: TextStyle(
              color: Palate.shiftTextColorSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

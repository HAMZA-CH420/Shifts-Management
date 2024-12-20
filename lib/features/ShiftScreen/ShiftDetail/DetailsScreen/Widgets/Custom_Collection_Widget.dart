import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Custom_Shift_Icon.dart';

class CustomCollectionWidget extends StatelessWidget {
  CustomCollectionWidget(
      {super.key, required this.title, required this.icon, required this.time});
  final String title, time;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: [
            CustomShiftIcon(
                icon: Icon(
              icon,
              color: Palate.primaryColor,
            )),
            Text(
              time,
              style: TextStyle(
                color: Palate.TextFieldTextColor,
                fontSize: 15,
              ),
            )
          ],
        )
      ],
    );
  }
}
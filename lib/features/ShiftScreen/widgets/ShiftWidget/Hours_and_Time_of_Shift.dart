import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class HoursAndTimeOfShift extends StatelessWidget {
  const HoursAndTimeOfShift({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 28,
          width: 40,
          decoration: BoxDecoration(
              color: Palate.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              )),
          child: Center(
            child: Text(
              "4hr",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Container(
          height: 28,
          width: 110,
          decoration: BoxDecoration(
              color: Palate.navBarColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              )),
          child: Center(
            child: Text(
              "01:00 - 04:00 am",
              style: TextStyle(color: Palate.primaryColor, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}

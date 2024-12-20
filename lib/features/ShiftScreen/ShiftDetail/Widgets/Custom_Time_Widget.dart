import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomTimeWidget extends StatelessWidget {
  const CustomTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 70,
          width: 170,
          decoration: BoxDecoration(
              color: Palate.navBarColor,
              borderRadius: BorderRadius.circular(10)),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Shift Starts At",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: Palate.primaryColor)),
              Text(
                "09:45 AM",
                style: TextStyle(
                  fontSize: 15,
                  color: Palate.shiftTextColor,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 70,
          width: 170,
          decoration: BoxDecoration(
              color: Palate.navBarColor,
              borderRadius: BorderRadius.circular(10)),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Remaining Time",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: Palate.primaryColor)),
              Text(
                "4 hrs",
                style: TextStyle(
                    fontSize: 15,
                    color: Palate.shiftTextColor,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ],
    );
  }
}

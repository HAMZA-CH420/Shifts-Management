import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shifts_management/features/ShiftScreen/Filter%20Screen/Widget/Custom_OutlinedButton.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          spacing: 10,
          children: [
            CustomOutlinedbutton(Status: "select"),
            CustomOutlinedbutton(Status: "Plumber"),
            CustomOutlinedbutton(Status: "Driver"),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            CustomOutlinedbutton(Status: "Cock"),
            CustomOutlinedbutton(Status: "Cleaner"),
            CustomOutlinedbutton(Status: "Guard"),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            CustomOutlinedbutton(Status: "Bartender"),
            CustomOutlinedbutton(Status: "Bouncer"),
            CustomOutlinedbutton(Status: "Truck Driver"),
          ],
        )
      ],
    );
  }
}

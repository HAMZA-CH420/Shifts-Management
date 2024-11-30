import 'package:flutter/material.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/TabBar/Date_of_Shift.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/TabBar/Hours_and_Time_of_Shift.dart';

class CustomShiftWidget extends StatelessWidget {
  const CustomShiftWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateOfShift(),
                HoursAndTimeOfShift(),
              ],
            ),
            Row(
              children: [
                CircleAvatar(child: Image.asset("assets/images/Dp.png")),
                Column(
                  children: [],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

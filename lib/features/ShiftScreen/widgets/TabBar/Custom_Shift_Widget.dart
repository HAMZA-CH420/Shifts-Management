import 'package:flutter/material.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/TabBar/Date_of_Shift.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/TabBar/Hours_and_Time_of_Shift.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/TabBar/Location_Of_Shift.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/TabBar/Status_of_Shift.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/TabBar/Type_of_Shift.dart';

class CustomShiftWidget extends StatelessWidget {
  const CustomShiftWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateOfShift(),
                HoursAndTimeOfShift(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(child: Image.asset("assets/images/Dp.png")),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LocationOfShift(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TypeOfShift(),
                        SizedBox(
                          width: 80,
                        ),
                        StatusOfShift(),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

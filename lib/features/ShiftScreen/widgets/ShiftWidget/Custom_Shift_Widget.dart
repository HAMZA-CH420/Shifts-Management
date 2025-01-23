import 'package:flutter/material.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Date_of_Shift.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Hours_and_Time_of_Shift.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Location_Of_Shift.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Status_of_Shift.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Type_of_Shift.dart';

class CustomShiftWidget extends StatelessWidget {
  const CustomShiftWidget(
      {super.key,
      required this.date,
      required this.duration,
      required this.startingTime,
      required this.endingTime,
      required this.location,
      required this.category,
      required this.status});
  final String date, startingTime, endingTime, location, category, status;
  final int duration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateOfShift(
                    date: date,
                  ),
                  HoursAndTimeOfShift(
                    duration: duration,
                    startingTime: startingTime,
                    endingTime: endingTime,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(child: Image.asset("assets/images/Dp.png")),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocationOfShift(
                        location: location,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TypeOfShift(
                            category: category,
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          StatusOfShift(
                            status: status,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

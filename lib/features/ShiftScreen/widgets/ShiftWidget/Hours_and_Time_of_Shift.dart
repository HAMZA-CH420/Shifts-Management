import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class HoursAndTimeOfShift extends StatelessWidget {
  const HoursAndTimeOfShift(
      {super.key,
      required this.duration,
      required this.startingTime,
      required this.endingTime});
  final String startingTime, endingTime;
  final int duration;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 28,
          width: 40,
          decoration: const BoxDecoration(
              color: Palate.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              )),
          child: Center(
            child: Text(
              "${duration}hrs",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Container(
          height: 28,
          width: 140,
          decoration: const BoxDecoration(
              color: Palate.navBarColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              )),
          child: Center(
            child: Text(
              "$startingTime - $endingTime",
              style: const TextStyle(color: Palate.primaryColor, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}

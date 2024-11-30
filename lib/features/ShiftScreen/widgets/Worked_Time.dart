import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class WorkedTime extends StatelessWidget {
  const WorkedTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 70,
            width: 155,
            decoration: BoxDecoration(
                color: Palate.navBarColor,
                borderRadius: BorderRadius.circular(10)),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Total Working Hours",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        color: Palate.primaryColor)),
                Text(
                  "35",
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
          Container(
            height: 70,
            width: 155,
            decoration: BoxDecoration(
                color: Palate.navBarColor,
                borderRadius: BorderRadius.circular(10)),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Total Working Days",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        color: Palate.primaryColor)),
                Text(
                  "04",
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

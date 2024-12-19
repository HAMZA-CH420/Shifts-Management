import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class AssignedWidget extends StatelessWidget {
  const AssignedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: 370,
      decoration: BoxDecoration(
        color: Palate.navBarColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Assigned by ",
            style: TextStyle(
                color: Palate.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          Row(
            spacing: 5,
            children: [
              Image.asset("assets/avatars/avatarPerson.png"),
              const Text(
                "Farman Haris",
                style: TextStyle(
                    color: Palate.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StatusOfShift extends StatelessWidget {
  const StatusOfShift({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 95,
      decoration: BoxDecoration(
        color: Color(0XFF15DA00),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          "Ongoing",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

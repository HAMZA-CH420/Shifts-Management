import 'package:flutter/material.dart';

class StatusOfShift extends StatelessWidget {
  StatusOfShift({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 95,
      decoration: BoxDecoration(
        color: const Color(0XFF15DA00),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          status,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

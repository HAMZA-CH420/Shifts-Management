import 'package:flutter/material.dart';

class StatusOfShift extends StatelessWidget {
  const StatusOfShift({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 77,
      decoration: BoxDecoration(
        color: const Color(0XFF15DA00),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          status,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomAddShiftTile extends StatelessWidget {
  const CustomAddShiftTile(
      {super.key, required this.icon, required this.banner});
  final Widget icon;
  final Widget banner;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 55,
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [banner, icon],
        ),
      ),
    );
  }
}
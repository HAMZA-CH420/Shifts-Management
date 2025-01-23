import 'package:flutter/cupertino.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class DateOfShift extends StatelessWidget {
  const DateOfShift({super.key, required this.date});
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        color: Palate.navBarColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Text(
        date,
        style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Palate.primaryColor),
      )),
    );
  }
}

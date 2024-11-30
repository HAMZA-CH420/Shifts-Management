import 'package:flutter/material.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/TabBar/Custom_Shift_Widget.dart';

class MyShifts extends StatelessWidget {
  const MyShifts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: CustomShiftWidget(),
      ),
    );
  }
}

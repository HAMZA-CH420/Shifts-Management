import 'package:flutter/material.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Custom_Shift_Widget.dart';

class ShiftProvider extends ChangeNotifier {
  List<String> status = [];
  List<Widget> myShifts = [];
  void addShift() {
    return myShifts.add(const CustomShiftWidget());
  }
}

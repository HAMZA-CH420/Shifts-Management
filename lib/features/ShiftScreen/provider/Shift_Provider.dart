import 'package:flutter/material.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Custom_Shift_Widget.dart';

class ShiftProvider extends ChangeNotifier {
  final List<String> status = [];
  final List<Widget> _myShifts = [CustomShiftWidget()];

  //Method to add Shifts
  void addShift() {
    _myShifts.add(const CustomShiftWidget());
    notifyListeners();
  } // Method to fetch Shifts

  List<Widget> MyShifts() => _myShifts;
}

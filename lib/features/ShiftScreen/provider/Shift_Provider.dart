import 'package:flutter/material.dart';

class ShiftProvider extends ChangeNotifier {
  final List<String> status = [];
  final List<Widget> _myShifts = [];

  //Method to add Shifts
  void addShift() {
    _myShifts.add;
    notifyListeners();
  } // Method to fetch Shifts

  List<Widget> MyShifts() => _myShifts;
}

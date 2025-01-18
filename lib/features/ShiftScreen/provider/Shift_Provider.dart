import 'package:flutter/material.dart';

class ShiftProvider extends ChangeNotifier {
  //get selected category of the shift
  late String _category;
  String get category => _category;
  void addCategory(String value) {
    _category = value;
  }

// get selected date of the shift
  late String _dateOfShift;
  String get dateOfShift => _dateOfShift;
  void addDate(String value) {
    _dateOfShift = value;
  }
}

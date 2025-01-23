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

// get starting time of the shift
  late String _startTime;
  String get startTime => _startTime;
  void addStartTime(String value) {
    _startTime = value;
  }

// get ending time of the shift
  late String _endTime;
  String get endTime => _endTime;
  void addEndTime(String value) {
    _endTime = value;
  }

// get location of the shift
  late String _location;
  String get location => _location;
  void addLocation(String value) {
    _location = value;
  }

// get Status of the Shift
  late String _status;
  String get status => _status;
  void addStatus(String value) {
    _status = value;
  }

// get Duration of the Shift
  late int _duration;
  int get duration => _duration;
  void getDuration(int value) {
    _duration = value;
  }

// get description of the shift
  late String _description;
  String get description => _description;
  void addDescription(String value) {
    _description = value;
  }
}

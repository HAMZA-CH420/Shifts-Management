import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  String? Validate(var value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}

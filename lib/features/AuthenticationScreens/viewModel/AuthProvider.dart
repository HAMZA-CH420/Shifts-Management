import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  // Password Properties Validator
  passwordValidate(var value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  //Email Properties Validator
  emailValidate(var value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Username Properties Validator
  usernameValidate(var value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    if (value.contains('!@#%^&*()_+~`|?/<>,.:;')) {
      return 'Please enter a valid username';
    }
  }
}

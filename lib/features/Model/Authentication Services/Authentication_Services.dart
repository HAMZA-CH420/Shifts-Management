import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationServices {
  Future<void> loginUserWithCredentials(
      BuildContext context, email, password) async {
    try {
      final userCredentials =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var pref = await SharedPreferences.getInstance();
      pref.setBool("isLoggedIn", false);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid username or password!")));
    }
  }

  void signInWithGoogle() {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      FirebaseAuth.instance.signInWithProvider(googleProvider);
    } catch (error) {
      print(error);
    }
  }
}

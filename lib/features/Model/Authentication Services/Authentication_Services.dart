import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shifts_management/features/AuthenticationScreens/Login%20Screen/Login_Screen.dart';
import 'package:shifts_management/features/AuthenticationScreens/SignUp%20Screen/Otp%20Screen/Otp_Screen.dart';

class AuthenticationServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> loginUserWithCredentials(
    BuildContext context,
    email,
    password,
  ) async {
    try {
      final userCredentials = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var pref = await SharedPreferences.getInstance();
      pref.setBool("isLoggedIn", false);
    } on FirebaseAuthException {
      Fluttertoast.showToast(
          msg: "Invalid username or password!",
          textColor: Colors.white,
          backgroundColor: Colors.red);
    } on SocketException {
      Fluttertoast.showToast(
          msg: 'No Internet Connection!',
          textColor: Colors.white,
          backgroundColor: Colors.red);
    }
  }

  void signInWithGoogle() {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      auth.signInWithProvider(googleProvider);
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    }
  }

  Future<void> createUserWithEmailAndPassword(
      BuildContext context,
      bool isChanged,
      String email,
      String password,
      number,
      String username) async {
    if (!isChanged) {
      try {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        auth.currentUser?.updateProfile(displayName: username);
        firestore.collection("users").doc(auth.currentUser!.uid).set({
          "username": username,
          "email": email,
          "uid": auth.currentUser!.uid,
          "status": ""
        });
        Fluttertoast.showToast(
          msg: "User Created Successfully.",
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      } on FirebaseAuthException {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("User Already Exists"),
        ));
      }
    } else {
      auth.verifyPhoneNumber(
          phoneNumber: number,
          verificationCompleted: (PhoneAuthCredential credentials) {},
          verificationFailed: (FirebaseAuthException ex) {},
          codeSent: (String verificationId, int? resendToken) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpScreen(
                    verificationId: verificationId,
                  ),
                ));
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    }
  }
}

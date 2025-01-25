import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shifts_management/features/AuthenticationScreens/Login%20Screen/Login_Screen.dart';
import 'package:shifts_management/features/AuthenticationScreens/SignUp%20Screen/Otp%20Screen/Otp_Screen.dart';

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
    } on FirebaseAuthException {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid username or password!")));
    }
  }

  void signInWithGoogle() {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      FirebaseAuth.instance.signInWithProvider(googleProvider);
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    }
  }

  Future<void> createUserWithEmailAndPassword(
      BuildContext context,
      bool isChanged,
      emailController,
      passwordController,
      numberController,
      String username) async {
    if (!isChanged) {
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim());
        FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          "name": username,
          "email": emailController,
          "status": "Unavailable",
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
      FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: numberController.text.toString(),
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Button.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_TextField.dart';
import 'package:shifts_management/features/AuthenticationScreens/SignUp%20Screen/SignUp_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(58),
                  child: SvgPicture.asset(
                    height: 120,
                    width: 120,
                    "assets/images/Logo1.svg",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  controller: usernameController,
                  labelText: "Username",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                  isHidden: true,
                  controller: passwordController,
                  labelText: "Password",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      const SizedBox(
                        width: 3,
                      ),
                      InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              )),
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                color: Palate.primaryColor,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                CustomButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await loginUserWithCredentials();
                    }
                  },
                  btnName: "Login",
                  btnColor: Palate.primaryColor,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "or",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ),
                CustomButton(
                  onTap: () => signInWithGoogle,
                  btnColor: Colors.transparent,
                  btnname: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/google.svg",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Continue with Google",
                          style: TextStyle(
                              color: Palate.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ).outlinedBtn()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUserWithCredentials() async {
    try {
      final userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usernameController.text.trim(),
              password: passwordController.text.trim());
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

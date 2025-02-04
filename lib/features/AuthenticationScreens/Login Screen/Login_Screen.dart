import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Button.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_TextField.dart';
import 'package:shifts_management/features/AuthenticationScreens/SignUp%20Screen/SignUp_Screen.dart';
import 'package:shifts_management/features/AuthenticationScreens/viewModel/AuthProvider.dart';
import 'package:shifts_management/features/Model/Authentication%20Services/Authentication_Services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthenticationServices authService = AuthenticationServices();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                    validator: (value) => AuthenticationProvider()
                        .emailValidate(value, "Please enter your username"),
                    controller: usernameController,
                    labelText: "Username or Email or Mobile",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    validator: (value) => AuthenticationProvider()
                        .passwordValidate(value, "Please enter your Password"),
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
                                  builder: (context) => const SignupScreen(),
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
                        await authService.loginUserWithCredentials(
                            context,
                            usernameController.text.trim(),
                            passwordController.text.trim());
                      }
                    },
                    btnName: "Login",
                    btnColor: Palate.primaryColor,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "or",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ),
                  CustomButton(
                    onTap: () => authService.signInWithGoogle(),
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
      ),
    );
  }
}

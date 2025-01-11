import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Button.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_TextField.dart';
import 'package:shifts_management/features/AuthenticationScreens/Login%20Screen/Login_Screen.dart';
import 'package:shifts_management/features/AuthenticationScreens/SignUp%20Screen/Otp%20Screen/Otp_Screen.dart';
import 'package:shifts_management/features/AuthenticationScreens/viewModel/AuthProvider.dart';
import 'package:shifts_management/features/Model/Authentication%20Services/Authentication_Services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  bool isChanged = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Palate.primaryColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
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
                  labelText: "Username",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextfield(
                    validator: (value) => AuthenticationProvider()
                        .emailValidate(
                            value,
                            isChanged
                                ? "Please enter your Phone Number"
                                : "Please enter your Email"),
                    labelText: isChanged ? "Phone Number" : "Email",
                    controller: isChanged ? numberController : emailController),
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
                      const Text("Already have an account?"),
                      const SizedBox(
                        width: 3,
                      ),
                      InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              )),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Palate.primaryColor,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await createUserWithEmailAndPassword();
                    }
                  },
                  btnName: isChanged ? "Get Otp" : "SignUp",
                  btnColor: Palate.primaryColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onTap: () {
                    setState(() {
                      isChanged = !isChanged;
                    });
                  },
                  btnColor: Colors.transparent,
                  btnname: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isChanged ? Icons.phone : Icons.mail,
                        color: Palate.primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                          isChanged
                              ? "Continue with Email"
                              : "Continue with PhoneNumber",
                          style: const TextStyle(
                              color: Palate.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ).outlinedBtn(),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onTap: () => AuthenticationServices().signInWithGoogle(),
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
                ).outlinedBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createUserWithEmailAndPassword() async {
    if (!isChanged) {
      try {
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim());
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("User Already Exists")));
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

import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Button.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_TextField.dart';
import 'package:shifts_management/features/Login%20Screen/Login_Screen.dart';
import 'package:shifts_management/features/SignUp%20Screen/Otp%20Screen/Otp_Screen.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Flexify.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Palate.primaryColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
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
                controller: usernameController,
                labelText: "Username",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                  labelText: isChanged ? "Phone Number" : "Email",
                  controller: isChanged ? numberController : emailController),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                isHidden: true,
                controller: passwordController,
                labelText: "Password",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    const SizedBox(
                      width: 3,
                    ),
                    InkWell(
                        onTap: () => Flexify.go(LoginScreen(),
                            animation: FlexifyRouteAnimations.fade,
                            animationDuration: Duration(milliseconds: 200)),
                        child: Text(
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
                onTap: () {
                  var number = numberController.text.toString();
                  var email = emailController.text;
                  Flexify.go(
                      OtpScreen(
                        value: isChanged ? number : email,
                      ),
                      animation: FlexifyRouteAnimations.fade,
                      animationDuration: Duration(milliseconds: 200));
                },
                btnName: "Get Otp",
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
                            ? "Continue with PhoneNumber"
                            : "Continue with Email",
                        style: TextStyle(
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
                onTap: () {},
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
                    Text("Continue with Google",
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
    );
  }
}

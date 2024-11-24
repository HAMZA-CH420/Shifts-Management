import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Button.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_TextField.dart';
import 'package:shifts_management/features/AuthenticationScreens/SignUp%20Screen/SignUp_Screen.dart';
import 'package:shifts_management/features/Bottom%20NavBar/Bottom_navBar.dart';
import 'package:shifts_management/features/HomeScreen/Chat_HomePage.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                controller: usernameController,
                labelText: "Username",
              ),
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
                    Text("Don't have an account?"),
                    const SizedBox(
                      width: 3,
                    ),
                    InkWell(
                        onTap: () => Flexify.go(SignupScreen(),
                            animation: FlexifyRouteAnimations.fade,
                            animationDuration: Duration(milliseconds: 300)),
                        child: Text(
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
                onTap: () =>Flexify.go(BottomNavbar(),
                    animation: FlexifyRouteAnimations.slide,
                    animationDuration: Duration(milliseconds: 200)),
                btnName: "Login",
                btnColor: Palate.primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "or",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
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
              ).outlinedBtn()
            ],
          ),
        ),
      ),
    );
  }
}

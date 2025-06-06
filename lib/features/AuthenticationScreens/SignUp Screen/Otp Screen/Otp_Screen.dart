import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Button.dart';
import 'package:shifts_management/features/Edit%20Profile%20Screen/Edit_Profile_Screen.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen(
      {super.key, this.value = "03001234567", required this.verificationId});
  String verificationId;
  final String value;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 114,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(58),
                  child: SvgPicture.asset(
                    height: 120,
                    width: 120,
                    "assets/images/Logo1.svg",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Palate.primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                            color: Palate.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Confirmation",
                          style: TextStyle(
                            color: Palate.primaryColor,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Enter 4-digit verification code we just sent on ${widget.value}",
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Palate.primaryColor,
                                  width: 1.5,
                                )),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: otpController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          btnColor: Palate.primaryColor,
                          onTap: () async {
                            PhoneAuthCredential credentials =
                                await PhoneAuthProvider.credential(
                                    verificationId: widget.verificationId,
                                    smsCode: otpController.text.toString());
                            FirebaseAuth.instance
                                .signInWithCredential(credentials)
                                .then((value) {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: EditProfileScreen(),
                                      type: PageTransitionType.bottomToTop));
                            });
                          },
                          btnName: "Verify",
                        )
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Text("Resend",
                    style: TextStyle(
                      color: Palate.primaryColor,
                      decoration: TextDecoration.underline,
                    )),
                const SizedBox(
                  height: 50,
                ),
                const CircularProgressIndicator(
                  color: Palate.primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

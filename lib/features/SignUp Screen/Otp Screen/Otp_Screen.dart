import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Button.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, this.value = "03001234567"});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                onTap: () => Flexify.back(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: Palate.primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
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
                  padding: EdgeInsets.symmetric(horizontal: 5),
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
                        "Enter 4-digit verification code we just sent on ${value}",
                      ),
                      SizedBox(
                        height: 120,
                        width: 370,
                        child: GridView.builder(
                          itemCount: 4,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(right: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                    border: Border.fromBorderSide(BorderSide(color: Colors.grey.withOpacity(0.2))),
                                    boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(3, 2))
                                ]),

                                child: Center(child: Text("0")),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),
                      CustomButton(btnColor: Palate.primaryColor, onTap: (){},btnName: "Verify",)
                    ],
                  )),
              const SizedBox(height: 15,),
              Text("Resend",style: TextStyle(color: Palate.primaryColor,decoration: TextDecoration.underline,)),
              const SizedBox(height: 50,),
              CircularProgressIndicator(color: Palate.primaryColor,)
            ],
          ),
        ),
      ),
    );
  }
}

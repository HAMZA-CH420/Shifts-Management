import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Button.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_TextField.dart';
import 'package:shifts_management/features/Bottom%20NavBar/Bottom_navBar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isVerified = false;

  TextEditingController usernameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_sharp)),
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/Avatar.png"),
                  radius: 50,
                ),
                Positioned(
                    left: 75,
                    top: 66,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: SvgPicture.asset('assets/images/editIcon.svg'),
                    ))
              ]),
              const SizedBox(
                height: 15,
              ),
              CustomTextfield(
                  labelText: "Full Name", controller: nameController),
              const SizedBox(
                height: 30,
              ),
              CustomTextfield(
                  labelText: "Username", controller: usernameController),
              const SizedBox(
                height: 30,
              ),
              CustomTextfield(
                labelText: "Email",
                controller: emailController,
                suffixText: "verified",
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextfield(
                  labelText: "Phone Number", controller: numberController),
              const SizedBox(
                height: 30,
              ),
              CustomTextfield(
                  labelText: "Address(optional)",
                  controller: addressController),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                btnColor: Palate.primaryColor,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const BottomNavbar(),
                        curve: Curves.elasticOut,
                        type: PageTransitionType.bottomToTop,
                        duration: const Duration(milliseconds: 500)),
                  );
                },
                btnName: "update",
              )
            ],
          ),
        ),
      ),
    );
  }
}

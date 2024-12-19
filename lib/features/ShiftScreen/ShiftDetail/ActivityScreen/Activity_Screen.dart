import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/ActivityScreen/Widgets/Stepper_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/DetailsScreen/Widgets/Custom_Button_Shift.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: CustomButtonShift(
        btnName: "End Job",
        onTap: () {},
        color: Palate.navBarColor,
        bgColor: Palate.primaryColor,
      ),
      body: StepperWidget(),
    );
  }
}

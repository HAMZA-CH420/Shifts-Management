import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;

  void onContinue() {
    if (_currentStep < 6) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void onCancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      onStepContinue: onContinue,
      onStepCancel: onCancel,
      currentStep: _currentStep,
      connectorThickness: 1.5,
      steps: [
        Step(
          isActive: _currentStep >= 0,
          stepStyle: const StepStyle(color: Palate.primaryColor),
          title: const Text(
            "Started Location",
            style: TextStyle(
                color: Palate.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
          content: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                height: 70,
                width: 170,
                child: Image.asset(
                  "assets/images/Map1.png",
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Step(
            isActive: _currentStep >= 1,
            stepStyle: const StepStyle(color: Palate.primaryColor),
            title: const Text(
              "Started Work",
              style: TextStyle(
                  color: Palate.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            content: const Text("Break")),
        Step(
          isActive: _currentStep >= 2,
          stepStyle: const StepStyle(color: Palate.primaryColor),
          title: const Text(
            "Took a selfie and sent to admin",
            style: TextStyle(
                color: Palate.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
          content: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                height: 150,
                width: 90,
                child: Image.asset(
                  "assets/images/selfie.png",
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Step(
            isActive: _currentStep >= 3,
            stepStyle: const StepStyle(color: Palate.primaryColor),
            title: const Text(
              "Took a meal break",
              style: TextStyle(
                  color: Palate.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            content: const Text("Meal Break")),
        Step(
            isActive: _currentStep >= 4,
            stepStyle: const StepStyle(color: Palate.primaryColor),
            title: const Text(
              "Started work again",
              style: TextStyle(
                  color: Palate.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            content: const Text("work")),
        Step(
            isActive: _currentStep >= 5,
            stepStyle: const StepStyle(color: Palate.primaryColor),
            title: const Text(
              "Take a selfie and send to admin",
              style: TextStyle(
                  color: Palate.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            content: const Text("selfie")),
        Step(
            isActive: _currentStep >= 6,
            stepStyle: const StepStyle(color: Palate.primaryColor),
            title: const Text(
              "Started Work",
              style: TextStyle(
                  color: Palate.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            content: const Text("Ended shift")),
      ],
    );
  }
}

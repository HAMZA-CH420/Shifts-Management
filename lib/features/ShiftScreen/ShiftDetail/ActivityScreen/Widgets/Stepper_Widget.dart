import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class StepperWidget extends StatefulWidget {
  StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;

  bool _isActive = true;

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
          isActive: _currentStep == 0 ? _isActive : !_isActive,
          stepStyle:
              StepStyle(color: _isActive ? Palate.primaryColor : Colors.grey),
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
        const Step(
            title: Text(
              "Started Work",
              style: TextStyle(
                  color: Palate.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            content: Text("Break")),
        Step(
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
        const Step(
            title: Text(
              "Took a meal break",
              style: TextStyle(
                  color: Palate.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            content: Text("Meal Break")),
        const Step(
            title: Text(
              "Started work again",
              style: TextStyle(
                  color: Palate.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            content: Text("work")),
        const Step(
            title: Text(
              "Take a selfie and send to admin",
              style: TextStyle(
                  color: Palate.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            content: Text("selfie")),
        const Step(
            title: Text(
              "Started Work",
              style: TextStyle(
                  color: Palate.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            content: Text("Ended shift")),
      ],
    );
  }
}

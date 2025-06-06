import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.btnName = "",
    required this.btnColor,
    this.btnname = const Text("BtnName"),
    required this.onTap,
  });

  final String btnName;
  final Color btnColor;
  final Widget btnname;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
        onPressed: onTap,
        child: Text(
          btnName,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget outlinedBtn() {
    return SizedBox(
      height: 50,
      width: 370,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side:
                    const BorderSide(color: Palate.primaryColor, width: 1.5))),
        onPressed: onTap,
        child: btnname,
      ),
    );
  }
}

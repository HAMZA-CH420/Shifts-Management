import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomOutlinedbutton extends StatefulWidget {
  const CustomOutlinedbutton({super.key});

  @override
  State<CustomOutlinedbutton> createState() => _CustomOutlinedbuttonState();
}

class _CustomOutlinedbuttonState extends State<CustomOutlinedbutton> {
  bool _isSelected = false;

  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _isSelected = !_isSelected;
        if (_isSelected) {
          color = Palate.primaryColor;
        }
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 35,
          width: 105,
          decoration: BoxDecoration(
              color: _isSelected ? Palate.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Palate.primaryColor,
                width: 1.5,
              )),
          child: Center(
            child: Text(
              "Completed",
              style: TextStyle(
                  color: _isSelected ? Colors.white : Palate.primaryColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

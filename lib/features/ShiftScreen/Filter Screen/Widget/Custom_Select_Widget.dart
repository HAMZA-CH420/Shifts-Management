import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomSelectWidget extends StatelessWidget {
  const CustomSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          width: 290,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: Palate.navBarColor,
          ),
          child: Text(
            "Select Person",
            style: TextStyle(
                color: Palate.primaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          height: 40,
          width: 60,
          decoration: BoxDecoration(
              color: Palate.primaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}

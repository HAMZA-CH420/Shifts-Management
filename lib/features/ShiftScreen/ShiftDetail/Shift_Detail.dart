import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Banner.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/Widgets/Custom_Time_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Status_of_Shift.dart';

class ShiftDetail extends StatelessWidget {
  const ShiftDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shift Details"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.ellipsisVertical),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBanner(bannerTitle: "Bars & Waiters"),
                StatusOfShift(),
              ],
            ),
            CustomTimeWidget(),
          ],
        ),
      ),
    );
  }
}

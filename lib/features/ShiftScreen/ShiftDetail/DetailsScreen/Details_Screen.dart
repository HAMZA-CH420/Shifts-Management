import 'package:flutter/material.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/DetailsScreen/Widgets/Assigned_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/DetailsScreen/Widgets/Custom_Button_Shift.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/DetailsScreen/Widgets/Custom_Collection_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/DetailsScreen/Widgets/Custom_Map.dart';

import '../../../../UiHelpers/theme/Color_Palate.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {super.key,
      required this.date,
      required this.category,
      required this.location});
  final String date, category, location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 15,
          children: [
            InkWell(
              child: const CustomMap(),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/images/Map1.png",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCollectionWidget(
                  title: "Date",
                  icon: Icons.calendar_month_sharp,
                  time: date,
                ),
                const CustomCollectionWidget(
                  title: "Break",
                  icon: Icons.watch_later,
                  time: "30 min",
                ),
                CustomCollectionWidget(
                  title: "Category",
                  icon: Icons.filter_tilt_shift_outlined,
                  time: category,
                ),
              ],
            ),
            CustomCollectionWidget(
              title: "Location",
              icon: Icons.location_on,
              time: location,
            ),
            const AssignedWidget(),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  " Details:",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  " We have an exciting house cleaning job opportunity for you. Responsibilities include dusting, vacuuming, mopping, sanitizing.",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Palate.TextFieldTextColor),
                ),
              ],
            ),
            CustomButtonShift(
              onTap: () {},
              btnName: "Take a Photo",
            ),
            CustomButtonShift(
              btnName: "Take a break",
              onTap: () {},
            ),
            CustomButtonShift(
              onTap: () {},
              btnName: "End Job",
              bgColor: Palate.primaryColor,
              color: Palate.navBarColor,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/Filter%20Screen/Widget/Custom_OutlinedButton.dart';
import 'package:shifts_management/features/ShiftScreen/Filter%20Screen/Widget/Custom_Select_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/Filter%20Screen/Widget/Custom_banner.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Custom_date%20widget.dart';

class BottomSheetFilter extends StatelessWidget {
  const BottomSheetFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffF4F4F4),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        children: [
          const Text(
            "Filters",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
          ),
          const CustomSelectWidget(),
          CustomFilterBanner(bannerTitle: "Status"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomOutlinedbutton(
                Status: "Ongoing",
              ),
              CustomOutlinedbutton(
                Status: "Upcoming",
              ),
              CustomOutlinedbutton(
                Status: "Late",
              ),
              CustomOutlinedbutton(
                Status: "Break",
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomOutlinedbutton(
                Status: "Completed",
              ),
              CustomOutlinedbutton(
                Status: "InReview",
              ),
              CustomOutlinedbutton(
                Status: "Pending",
              ),
              CustomOutlinedbutton(
                Status: "Paid",
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomOutlinedbutton(
                Status: "Open Shift",
              ),
            ),
          ),
          CustomFilterBanner(bannerTitle: "Date"),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomDateBox(
                value: "04",
                title: "DD",
              ),
              CustomDateBox(
                value: "12",
                title: "MM",
              ),
              CustomDateBox(
                value: "2024",
                title: "YYYY",
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palate.navBarColor,
                    fixedSize: const Size(140, 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Clear Filter",
                    style: TextStyle(
                      color: Palate.primaryColor,
                    ),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palate.primaryColor,
                    fixedSize: const Size(140, 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Show Results",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Palate.navBarColor,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}

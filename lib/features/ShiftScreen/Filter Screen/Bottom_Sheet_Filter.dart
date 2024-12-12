import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Banner.dart';
import 'package:shifts_management/features/ShiftScreen/Filter%20Screen/Widget/Custom_Select_Widget.dart';

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
          CustomSelectWidget(),
          CustomBanner(bannerTitle: "Status")
        ],
      ),
    );
  }
}

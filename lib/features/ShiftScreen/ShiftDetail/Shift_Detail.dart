import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Banner.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/DetailsScreen/Details_Screen.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/Widgets/Custom_Time_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Status_of_Shift.dart';

class ShiftDetail extends StatelessWidget {
  const ShiftDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shift Details"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.ellipsisVertical),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(180),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBanner(bannerTitle: "Bars & Waiters"),
                      const StatusOfShift(),
                    ],
                  ),
                  const CustomTimeWidget(),
                  const SizedBox(
                    height: 8,
                  ),
                  const TabBar(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      labelColor: Palate.primaryColor,
                      unselectedLabelColor: Palate.TextFieldTextColor,
                      overlayColor: WidgetStateColor.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerHeight: 2,
                      unselectedLabelStyle: TextStyle(color: Color(0XFF526070)),
                      labelStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      indicatorColor: Palate.primaryColor,
                      dividerColor: Color(0XFFD2E4FF),
                      tabs: [
                        Tab(text: "Details"),
                        Tab(text: "Activities"),
                      ]),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            DetailsScreen(),
            Tab(
              text: "Activities",
            ),
          ],
        ),
      ),
    );
  }
}

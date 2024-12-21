import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Banner.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/ActivityScreen/Activity_Screen.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/DetailsScreen/Details_Screen.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/Widgets/Custom_Time_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Status_of_Shift.dart';

class ShiftDetail extends StatefulWidget {
  ShiftDetail({super.key, required this.status});
  final String status;
  @override
  State<ShiftDetail> createState() => _ShiftDetailState();
}

class _ShiftDetailState extends State<ShiftDetail> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pop(context);
          });
          return Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            height: 300,
            width: double.infinity,
            child: Column(
              spacing: 30,
              children: [
                const Text(
                  "Remaining time",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Image.asset("assets/images/clock.png"),
                const Text(
                  "Hurry up only 15min are left",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                )
              ],
            ),
          );
        },
      );
    });
  }

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
                      StatusOfShift(status: widget.status)
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
            ActivityScreen(),
          ],
        ),
      ),
    );
  }
}

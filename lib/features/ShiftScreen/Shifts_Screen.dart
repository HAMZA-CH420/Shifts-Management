import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/Filter%20Screen/Bottom_Sheet_Filter.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Worked_Time.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/TabBar/My_Shifts.dart';

class ShiftsScreen extends StatelessWidget {
  const ShiftsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Tooltip(
              message: "Filter by",
              child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return BottomSheetFilter();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.filter_alt,
                    size: 28,
                  )),
            )
          ],
          title: const Text(
            "Shifts",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
            ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(130),
            child: Column(
              children: [
                WorkedTime(),
                SizedBox(
                  height: 8,
                ),
                TabBar(
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
                      Tab(text: "My Shifts"),
                      Tab(text: "Created Shift"),
                    ]),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            MyShifts(),
            Container(
              child: const Center(child: Text("Created Shift")),
            ),
          ],
        ),
      ),
    );
  }
}

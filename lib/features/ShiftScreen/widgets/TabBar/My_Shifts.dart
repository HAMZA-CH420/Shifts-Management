import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/Shift_Detail.dart';
import 'package:shifts_management/features/ShiftScreen/provider/Shift_Provider.dart';

class MyShifts extends StatelessWidget {
  const MyShifts({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> Shifts = context.watch<ShiftProvider>().MyShifts();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: ShiftDetail(), type: PageTransitionType.fade));
          },
          child: ListView.separated(
            itemCount: Shifts.length,
            itemBuilder: (BuildContext context, int index) {
              return Shifts.isNotEmpty
                  ? Shifts[index]
                  : SvgPicture.asset("assets/images/Shift.svg");
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 14,
            ),
          ),
        ),
      ),
    );
  }
}

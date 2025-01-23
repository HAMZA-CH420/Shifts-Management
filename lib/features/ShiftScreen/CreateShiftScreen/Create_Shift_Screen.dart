import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Add_Location.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Add_Shift_Time.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Custom_Add_Shift_Tile.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Date_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Description_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Status_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/drop_down.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/DetailsScreen/Widgets/Custom_Button_Shift.dart';
import 'package:shifts_management/features/ShiftScreen/provider/Shift_Provider.dart';

class CreateShiftScreen extends StatefulWidget {
  const CreateShiftScreen({super.key});

  @override
  State<CreateShiftScreen> createState() => _CreateShiftScreenState();
}

class _CreateShiftScreenState extends State<CreateShiftScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        title: const Text("Shift"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
              child: Column(
            spacing: 22,
            children: [
              DropDownCategoryWidget(),
              AddLocation(),
              DateWidget(),
              AddShiftTimeWidget(),
              const Text("To"),
              AddShiftTimeWidget(isEndingTime: true),
              CustomButtonShift(
                btnName: "Add break",
                onTap: () {},
                bgColor: Palate.navBarColor,
                color: Palate.shiftTextColor,
              ),
              StatusWidget(),
              CustomAddShiftTile(
                onTap: () {},
                icon: const Icon(
                  Icons.people,
                  color: Palate.primaryColor,
                ),
                banner: const Text(
                  "Add People",
                  style: TextStyle(
                      color: Palate.shiftTileBannerColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              DescriptionWidget(),
              CustomAddShiftTile(
                onTap: () {},
                icon: const Icon(
                  Icons.people,
                  color: Colors.transparent,
                ),
                banner: const Text(
                  "Add Tags",
                  style: TextStyle(
                      color: Palate.shiftTileBannerColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ))),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xffF4F4F4),
        child: CustomButtonShift(
          btnName: "create",
          onTap: () {
            var data = context.read<ShiftProvider>();
            var methode = FirebaseFirestore.instance;
            duration(context);
            if (data.category != null &&
                data.dateOfShift != null &&
                data.startTime != null &&
                data.endTime != null &&
                data.location != null &&
                data.status != null) {
              methode.collection("Shifts").add({
                "category": data.category,
                "date": data.dateOfShift,
                "duration": data.duration,
                "starting time": data.startTime,
                "ending time": data.endTime,
                "location": data.location,
                "status": data.status,
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 1),
                  shape: RoundedRectangleBorder(),
                  showCloseIcon: true,
                  content: Text('Please fill all the required fields')));
            }
            Navigator.pop(context);
          },
          color: Palate.navBarColor,
          bgColor: Palate.primaryColor,
        ),
      ),
    );
  }

  int duration(BuildContext context) {
    String startTimeString = context.read<ShiftProvider>().startTime;
    String endTimeString = context.read<ShiftProvider>().endTime;

// Assuming your time strings are in the format 'HH:mm'
    DateFormat format = DateFormat('HH:mm');

// Parse the strings into DateTime objects
    DateTime startTime = format.parse(startTimeString);
    DateTime endTime = format.parse(endTimeString);

// Calculate the difference
    Duration difference = endTime.difference(startTime);
//Get number of hours
    int totalHours = difference.inHours;
    context.read<ShiftProvider>().getDuration(totalHours);
    return totalHours;
  }
}

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
            methode.collection("CreatedShifts").add({
              "category": data.category,
              "date": data.dateOfShift,
              "duration": data.duration,
              "starting time": data.startTime,
              "ending time": data.endTime,
              "location": data.location,
              "status": data.status,
            });
            Navigator.pop(context);
          },
          color: Palate.navBarColor,
          bgColor: Palate.primaryColor,
        ),
      ),
    );
  }

  int calculateDuration(String startTimeString, String endTimeString) {
    // Assuming your time strings are in the format 'HH:mm' (24-hour format)
    DateFormat format = DateFormat('HH:mm');

    // Parse the strings into DateTime objects, using a dummy date
    DateTime now = DateTime.now();
    DateTime startTime = format.parse(startTimeString);
    DateTime endTime = format.parse(endTimeString);

    // Combine the parsed time with the current date
    startTime = DateTime(
        now.year, now.month, now.day, startTime.hour, startTime.minute);
    endTime =
        DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute);

    // Check if the end time is before the start time (crossing midnight)
    if (endTime.isBefore(startTime)) {
      // Add 24 hours to the end time to account for the day rollover
      endTime = endTime.add(Duration(days: 1));
    }

    // Calculate the difference
    Duration difference = endTime.difference(startTime);

    // Get the number of hours
    int totalHours = difference.inHours;

    return totalHours;
  }

  int duration(BuildContext context) {
    String startTimeString = context.read<ShiftProvider>().startTime;
    String endTimeString = context.read<ShiftProvider>().endTime;

    // Calculate the duration using the corrected function
    int totalHours = calculateDuration(startTimeString, endTimeString);

    // Update the provider
    Provider.of<ShiftProvider>(context, listen: false).getDuration(totalHours);

    return totalHours;
  }
}

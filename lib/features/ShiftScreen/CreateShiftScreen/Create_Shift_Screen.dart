import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Add_Location.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Add_Shift_Time.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Custom_Add_Shift_Tile.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Date_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Description_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Status_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/drop_down.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/DetailsScreen/Widgets/Custom_Button_Shift.dart';

class CreateShiftScreen extends StatefulWidget {
  const CreateShiftScreen({super.key});

  @override
  State<CreateShiftScreen> createState() => _CreateShiftScreenState();
}

class _CreateShiftScreenState extends State<CreateShiftScreen> {
  TextEditingController descriptionController = TextEditingController();
  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

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
              DescriptionWidget(
                controller: descriptionController,
              ),
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
          onTap: () {},
          color: Palate.navBarColor,
          bgColor: Palate.primaryColor,
        ),
      ),
    );
  }
}

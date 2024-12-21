import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Custom_Add_Shift_Tile.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/widgets/Description_Widget.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/DetailsScreen/Widgets/Custom_Button_Shift.dart';

class CreateShiftScreen extends StatelessWidget {
  CreateShiftScreen({super.key});
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              const CustomAddShiftTile(
                banner: Text(
                  "Select category",
                  style: TextStyle(
                      color: Palate.shiftTileBannerColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Palate.primaryColor,
                ),
              ),
              const CustomAddShiftTile(
                icon: Icon(
                  Icons.location_on,
                  color: Palate.primaryColor,
                ),
                banner: Text(
                  "Add Location",
                  style: TextStyle(
                      color: Palate.shiftTileBannerColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const CustomAddShiftTile(
                icon: Icon(
                  Icons.calendar_month_rounded,
                  color: Palate.primaryColor,
                ),
                banner: Text(
                  "Add Date",
                  style: TextStyle(
                      color: Palate.shiftTileBannerColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const CustomAddShiftTile(
                icon: Icon(
                  Icons.watch_later,
                  color: Palate.primaryColor,
                ),
                banner: Text(
                  "Shift Time",
                  style: TextStyle(
                      color: Palate.shiftTileBannerColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              CustomButtonShift(
                btnName: "Add break",
                onTap: () {},
                bgColor: Palate.navBarColor,
                color: Palate.shiftTextColor,
              ),
              const CustomAddShiftTile(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Palate.primaryColor,
                ),
                banner: Text(
                  "Status",
                  style: TextStyle(
                      color: Palate.shiftTileBannerColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const CustomAddShiftTile(
                icon: Icon(
                  Icons.people,
                  color: Palate.primaryColor,
                ),
                banner: Text(
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
              const CustomAddShiftTile(
                icon: Icon(
                  Icons.people,
                  color: Colors.transparent,
                ),
                banner: Text(
                  "Add Tags",
                  style: TextStyle(
                      color: Palate.shiftTileBannerColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

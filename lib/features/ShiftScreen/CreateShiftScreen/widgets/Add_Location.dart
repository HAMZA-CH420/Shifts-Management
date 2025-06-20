import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/provider/Shift_Provider.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: .5,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 7, left: 20, top: 3),
        height: 55,
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Add Location",
            hintStyle: TextStyle(
                color: Palate.textFieldTextColor,
                fontSize: 15,
                fontWeight: FontWeight.w400),
            suffixIcon: Icon(
              Icons.location_on,
              color: Palate.primaryColor,
            ),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            context
                .read<ShiftProvider>()
                .addLocation(controller.text.toString());
          },
        ),
      ),
    );
  }
}

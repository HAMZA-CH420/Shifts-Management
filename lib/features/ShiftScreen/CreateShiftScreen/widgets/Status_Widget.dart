import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/provider/Shift_Provider.dart';

class StatusWidget extends StatelessWidget {
  StatusWidget({super.key, this.onTap});
  final VoidCallback? onTap;
  final _categories = [
    "Upcoming",
    "Ongoing",
    "Completed",
    "Cancelled",
    "Pending",
    "In review",
    "Paid",
    "Late",
    "Break",
    "Open Shift"
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: .5,
      child: Container(
        height: 55,
        width: 370,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButtonFormField<String>(
            style: const TextStyle(
                color: Palate.shiftTileBannerColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Palate.primaryColor,
            ),
            borderRadius: BorderRadius.circular(10),
            dropdownColor: Colors.white,
            decoration: const InputDecoration(
              hintText: "Status",
              hintStyle: TextStyle(
                  color: Palate.shiftTileBannerColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              border: InputBorder.none,
            ),
            items: _categories.map((String categories) {
              return DropdownMenuItem(
                value: categories,
                child: Text(categories),
              );
            }).toList(),
            onChanged: (value) {
              context.read<ShiftProvider>().addStatus(value!);
            }),
      ),
    );
  }
}

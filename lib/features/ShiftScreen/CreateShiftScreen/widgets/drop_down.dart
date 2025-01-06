import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class DropDownCategoryWidget extends StatelessWidget {
  DropDownCategoryWidget({super.key, this.onTap});
  final VoidCallback? onTap;
  final _categories = [
    "Plumber",
    "Driver",
    "Cock",
    "Cleaner",
    "Guard",
    "Bartender",
    "Bouncer",
    "Truck Driver"
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
            icon: Icon(
              Icons.arrow_drop_down,
              color: Palate.primaryColor,
            ),
            borderRadius: BorderRadius.circular(10),
            dropdownColor: Colors.white,
            decoration: const InputDecoration(
              hintText: "Select Category",
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
            onChanged: (value) {}),
      ),
    );
  }
}

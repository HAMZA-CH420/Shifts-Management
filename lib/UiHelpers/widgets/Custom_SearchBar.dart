import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomSearchbar extends StatelessWidget {
  const CustomSearchbar({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFD2E4FF),
          borderRadius: BorderRadius.circular(7)
        ),
        width: 390,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_outlined,color: Palate.PrimaryTextColor,),
              hintText: "Search...",
              hintStyle: TextStyle(color: Palate.PrimaryTextColor),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

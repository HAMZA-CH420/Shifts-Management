import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomSearchbar extends StatefulWidget {
  const CustomSearchbar({super.key});

  @override
  State<CustomSearchbar> createState() => _CustomSearchbarState();
}

class _CustomSearchbarState extends State<CustomSearchbar> {
  final TextEditingController searchController = TextEditingController();

  late Map<String, dynamic> results;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0XFFD2E4FF),
            borderRadius: BorderRadius.circular(7)),
        width: 390,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search_outlined,
                color: Palate.PrimaryTextColor,
              ),
              hintText: "Search...",
              hintStyle: TextStyle(color: Palate.PrimaryTextColor),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  void onSearch() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("users")
        .where("email", isEqualTo: searchController.text)
        .get()
        .then((value) {
      setState(() {
        results = value.docs[0].data();
      });
      print(results);
    });
  }
}

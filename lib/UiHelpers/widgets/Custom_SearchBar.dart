import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomSearchbar extends StatefulWidget {
  const CustomSearchbar({super.key});

  @override
  State<CustomSearchbar> createState() => _CustomSearchbarState();
}

class _CustomSearchbarState extends State<CustomSearchbar> {
  late List<Map<String, dynamic>> results;
  final TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  Timer? _debounce;
  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

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
                color: Palate.primaryTextColor,
              ),
              hintText: "Search...",
              hintStyle: TextStyle(color: Palate.primaryTextColor),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce?.cancel();
              _debounce = Timer(const Duration(milliseconds: 500), () {
                onSearch(value);
              });
            },
          ),
        ),
      ),
    );
  }

  void onSearch(String value) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    if (value.isEmpty) {
      setState(() {
        results = [];
      });
      return;
    }
    setState(() {
      isLoading = true;
    });
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection("users")
          .where("username", isEqualTo: searchController.text)
          .get();
      setState(() {
        results = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: "An unexpected error happened",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shifts_management/features/Bottom%20NavBar/Model.dart';
import 'package:shifts_management/features/HomeScreen/Chat_HomePage.dart';
import 'package:shifts_management/features/ShiftScreen/Shifts_Screen.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({super.key});

  final _controller = PersistentTabController(initialIndex: 0);
  final List<Widget> _screens = [
    ChatHomeScreen(),
    ShiftsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      navBarHeight: 70,
      screens: _screens,
      items: Model.Items,

    );
  }
}

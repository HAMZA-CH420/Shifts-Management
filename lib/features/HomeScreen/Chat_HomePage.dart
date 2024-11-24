import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class ChatHomeScreen extends StatelessWidget {
 const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("App Bar"),
            centerTitle: true,
            bottom: const TabBar(
                padding: EdgeInsets.symmetric(horizontal: 50),
                labelColor: Palate.primaryColor,
                overlayColor: WidgetStateColor.transparent,
                dividerColor: Colors.transparent,
                labelStyle: TextStyle(fontSize: 18),
                indicatorColor: Palate.primaryColor ,
                tabs: [
                  Tab(text: "Chats",),
                  Tab(text: "Groups",),
                ]),
          ),
         body: TabBarView(
             children: [

             ]),
    ),);
  }
}

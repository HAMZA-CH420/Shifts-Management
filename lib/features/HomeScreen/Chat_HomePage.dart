import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_SearchBar.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            const Icon(
              Iconsax.notification,
              size: 30,
              color: Palate.PrimaryTextColor,
            ),
           const  SizedBox(
              width: 11,
            ),
          ],
          title: const Text(
            "Inbox",
            style: TextStyle(
                fontSize: 28,
                fontFamily: "medium",
                color: Palate.PrimaryTextColor),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Column(
              children: [
                SizedBox(
                  height: 14,
                ),
                CustomSearchbar(),
                SizedBox(
                  height: 5,
                ),
                TabBar(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    labelColor: Palate.primaryColor,
                    unselectedLabelColor: Palate.TextFieldTextColor,
                    overlayColor: WidgetStateColor.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 2,
                    unselectedLabelStyle: TextStyle(color: Color(0XFF526070)),
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    indicatorColor: Palate.primaryColor,
                    dividerColor: Color(0XFFD2E4FF),
                    tabs: [
                      Tab(text: "Chats"),
                      Tab(text: "Groups"),
                    ]),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          Container(
            child: Center(child: Text("Chats")),
          ),
          Container(
            child: Center(child: Text("Groups")),
          ),
        ]),
      ),
    );
  }

}

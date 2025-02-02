import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_SearchBar.dart';
import 'package:shifts_management/features/HomeScreen/chat/all_chats_screen.dart';
import 'package:shifts_management/features/HomeScreen/group/all_groups_screen.dart';
import 'package:shifts_management/features/HomeScreen/viewModel/provider/chat_provider.dart';
import 'package:shifts_management/features/Model/Notification%20Services/Notification_Services.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<ChatProvider>().updateUserStatus("online");
    }
    if (state == AppLifecycleState.detached) {
      context.read<ChatProvider>().updateUserStatus("Offline");
    }
    if (state == AppLifecycleState.inactive) {
      context.read<ChatProvider>().updateUserStatus("Offline");
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                onTap: () {
                  NotificationServices().notificationPermission();
                },
                child: const Icon(
                  Iconsax.notification,
                  size: 25,
                  color: Palate.PrimaryTextColor,
                ),
              ),
              const SizedBox(
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
          body: const TabBarView(children: [
            AllChatsScreen(),
            AllGroupsScreen(),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Model {
  static List<PersistentBottomNavBarItem> Items = [
    PersistentBottomNavBarItem(
      icon: ImageIcon(AssetImage("assets/icons/active_chat.png")),
      inactiveIcon: ImageIcon(AssetImage("assets/icons/inactive_chat.png"))
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.description_outlined),
      inactiveIcon: Icon(Icons.add),
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/HomeScreen/Chat_HomePage.dart';
import 'package:shifts_management/features/Profile_Screen/Profile_Screen.dart';
import 'package:shifts_management/features/ShiftScreen/CreateShiftScreen/Create_Shift_Screen.dart';
import 'package:shifts_management/features/ShiftScreen/Shifts_Screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar>
    with TickerProviderStateMixin {
  final List<AnimationController> _animationControllers = [];
  final List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _icons.length; i++) {
      AnimationController controller = AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this,
      );
      controller.value = 0;
      _animationControllers.add(controller);
      _animations.add(
        Tween<double>(begin: 0, end: 33).animate(controller),
      );
    }
  }

  int _currentIndex = 0;
  final List<ImageIcon> _icons = <ImageIcon>[
    const ImageIcon(
      AssetImage("assets/icons/active_chat.png"),
    ),
    const ImageIcon(
      AssetImage("assets/icons/shift_active.png"),
    ),
    const ImageIcon(
      AssetImage("assets/icons/profile_active.png"),
    ),
  ];
  final List<ImageIcon> _selectedIcons = <ImageIcon>[
    const ImageIcon(
      AssetImage("assets/icons/inactive_chat.png"),
    ),
    const ImageIcon(
      AssetImage("assets/icons/shift_inactive.png"),
    ),
    const ImageIcon(
      AssetImage("assets/icons/profile_inactive.png"),
    ),
  ];
  final List<Widget> _screens = [
    const ChatHomeScreen(),
    const ShiftsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Palate.primaryColor,
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const CreateShiftScreen(),
                  type: PageTransitionType.bottomToTop));
        },
        shape: const CircleBorder(),
        child: const Icon(
          size: 30,
          Icons.add,
          color: Palate.navBarColor,
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      padding: const EdgeInsets.only(left: 8),
      shadowColor: Colors.transparent,
      height: 70,
      color: Palate.navBarColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _bottomIcons(),
      ),
    );
  }

  List<Widget> _bottomIcons() {
    List<Widget> icons = [];
    for (int i = 0; i < _icons.length; i++) {
      icons.add(Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedBuilder(
            animation: _animations[i],
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _currentIndex == i
                      ? Palate.primaryColor
                      : Colors.transparent,
                ),
                height: 5,
                width: _animations[i].value,
              );
            },
          ),
          SizedBox(
            height: 60,
            width: 90,
            child: IconButton(
                color: Palate.primaryColor,
                onPressed: () {
                  setState(() {
                    _currentIndex = i;
                    for (int j = i; j < _icons.length; j++) {
                      if (j == i) {
                        _animationControllers[j].forward(from: 0);
                      } else {
                        _animationControllers[j].reverse(from: 1);
                      }
                    }
                  });
                },
                icon: _currentIndex == i ? _icons[i] : _selectedIcons[i]),
          )
        ],
      ));
    }
    return icons;
  }
}

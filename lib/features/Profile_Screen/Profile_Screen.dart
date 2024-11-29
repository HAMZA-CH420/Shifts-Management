import 'package:flexify/flexify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Banner.dart';
import 'package:shifts_management/UiHelpers/widgets/Custom_Profile_Banner.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.notification)),
        ],
        leading: IconButton(
            onPressed: () {
              Flexify.back();
            },
            icon: Icon(Icons.arrow_back_sharp)),
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/Avatar.png"),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    CustomBanner(
                      bannerTitle: "General",
                    ),
                    CustomProfileBanner(
                      onTap: () {},
                      bannerTitle: "Shift",
                      icon: Icons.watch_later_rounded,
                    ),
                    Divider(
                      color: Palate.dividerColor,
                    ),
                    CustomProfileBanner(
                      icon: Icons.person,
                      bannerTitle: "Account",
                      onTap: () {},
                    ),
                    Divider(
                      color: Palate.dividerColor,
                    ),
                    CustomProfileBanner(
                      icon: Icons.notifications,
                      bannerTitle: "Notification",
                      onTap: () {},
                    ),
                    CustomBanner(bannerTitle: "Content"),
                    CustomProfileBanner(
                        icon: CupertinoIcons.heart_fill,
                        bannerTitle: "My Planner",
                        onTap: () {}),
                    Divider(
                      color: Palate.dividerColor,
                    ),
                    CustomProfileBanner(
                        icon: Icons.calendar_month_rounded,
                        bannerTitle: "Schedule Shift",
                        onTap: () {}),
                    CustomBanner(bannerTitle: "Preferences"),
                    CustomProfileBanner(
                        icon: FontAwesomeIcons.language,
                        bannerTitle: "Language",
                        onTap: () {}),
                    CustomProfileBanner(
                        icon: Icons.dark_mode,
                        bannerTitle: "Dark Mode",
                        onTap: () {}),
                    CustomProfileBanner(
                        icon: Icons.edit_note_outlined,
                        bannerTitle: "Shift Edit",
                        onTap: () {}),
                    const SizedBox(
                      height: 65,
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

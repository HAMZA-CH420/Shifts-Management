import 'package:firebase_auth/firebase_auth.dart';
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
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          IconButton(
              onPressed: () async => await FirebaseAuth.instance.signOut(),
              icon: const Icon(
                Iconsax.logout,
                color: Colors.red,
              )),
        ],
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
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
                    const Divider(
                      color: Palate.dividerColor,
                    ),
                    CustomProfileBanner(
                      icon: Icons.person,
                      bannerTitle: "Account",
                      onTap: () {},
                    ),
                    const Divider(
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
                    const Divider(
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
                    const Divider(
                      color: Palate.dividerColor,
                    ),
                    CustomProfileBanner(
                        icon: Icons.dark_mode,
                        bannerTitle: "Dark Mode",
                        onTap: () {}),
                    const Divider(
                      color: Palate.dividerColor,
                    ),
                    CustomProfileBanner(
                        icon: Icons.edit_note_outlined,
                        bannerTitle: "Shift Edit",
                        onTap: () {}),
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

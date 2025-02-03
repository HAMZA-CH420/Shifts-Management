import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class AllGroupsScreen extends StatelessWidget {
  const AllGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.account_circle,
              color: Palate.primaryColor,
              size: 48,
            ),
            title: Text("Group $index",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Palate.primaryColor,
                )),
            subtitle: Text(
                "Hello, how are you?", // You can replace this with the last message
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Palate.shiftTextColorSecondary)),
            trailing: const Text(
              "10:00",
              style: TextStyle(fontSize: 12),
            ),
          );
        },
      ),
    );
  }
}

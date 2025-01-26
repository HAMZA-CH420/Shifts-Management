import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/HomeScreen/ChatRoom/chat_room.dart';

class AllChatsScreen extends StatelessWidget {
  const AllChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatRoom(),
                  ));
            },
            leading: const Icon(
              Icons.account_circle,
              color: Colors.grey,
              size: 48,
            ),
            title: Text(
              "John Doe",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Palate.primaryColor,
              ),
            ),
            subtitle: Text(
              "Hello, how are you?",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Palate.shiftTextColorSecondary,
              ),
            ),
            trailing: const Text("10:00 AM"),
          );
        },
      ),
    ));
  }
}

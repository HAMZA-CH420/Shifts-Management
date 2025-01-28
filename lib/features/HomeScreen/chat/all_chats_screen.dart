import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/HomeScreen/ChatRoom/chat_room.dart';
import 'package:shifts_management/features/HomeScreen/viewModel/provider/chat_provider.dart';

class AllChatsScreen extends StatefulWidget {
  const AllChatsScreen({super.key});

  @override
  State<AllChatsScreen> createState() => _AllChatsScreenState();
}

class _AllChatsScreenState extends State<AllChatsScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late Future<void> _fetchUsersFuture;

  @override
  void initState() {
    super.initState();
    _fetchUsersFuture =
        Provider.of<ChatProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUsersFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Unknown Error"));
        } else {
          return Consumer<ChatProvider>(
            builder: (context, provider, child) {
              final users = provider.userMapList;
              if (users.isEmpty) {
                return const Center(child: Text("No users found."));
              }
              final currentUserId = auth.currentUser?.uid;
              if (currentUserId == null) {
                return const Center(child: Text("User not logged in."));
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final otherUserId = users.keys.elementAt(index);
                    // Skip the current user
                    if (otherUserId == currentUserId) {
                      return const SizedBox.shrink();
                    }
                    final otherUserData = users[otherUserId];
                    final chatRoomId =
                        provider.chatRoomId(currentUserId, otherUserId);
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatRoom(
                              chatRoomId: chatRoomId,
                              userMap: otherUserData,
                            ),
                          ),
                        );
                      },
                      leading: const Icon(
                        Icons.account_circle,
                        color: Palate.primaryColor,
                        size: 48,
                      ),
                      title: Text(
                        otherUserData['username'] ?? 'No Username',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Palate.primaryColor,
                        ),
                      ),
                      subtitle: Text(
                        "Hello, how are you?", // You can replace this with the last message
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Palate.shiftTextColorSecondary,
                        ),
                      ),
                      trailing: Text(
                        otherUserData['status'],
                        style: TextStyle(
                            color: otherUserData["status"] == 'online'
                                ? Colors.green
                                : Colors.grey),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}

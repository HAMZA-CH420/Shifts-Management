import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/HomeScreen/ChatRoom/widgets/appbar.dart';
import 'package:shifts_management/features/HomeScreen/ChatRoom/widgets/message_input.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({
    super.key,
    required this.chatRoomId,
    required this.userMap,
  });
  final String chatRoomId;
  final Map<String, dynamic> userMap;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, userMap['username'], userMap['status']),
      resizeToAvoidBottomInset: true, // Enable resizing
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: firestore
                  .collection("chatroom")
                  .doc(chatRoomId)
                  .collection("chats")
                  .orderBy('time', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> map =
                        snapshot.data!.docs[index].data();
                    return messages(map);
                  },
                );
              },
            ),
          ),
          MessageInput(
            chatRoomId: chatRoomId,
            sendBy: auth.currentUser!.displayName ?? 'X',
          ),
        ],
      ),
    );
  }

  Widget messages(Map<String, dynamic> map) {
    return Container(
      alignment: map['sendBy'] == auth.currentUser?.displayName
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: Palate.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Text(
          map['message'],
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shifts_management/features/HomeScreen/ChatRoom/widgets/appbar.dart';
import 'package:shifts_management/features/HomeScreen/ChatRoom/widgets/message_input.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({
    super.key,
    this.chatRoomId,
    this.userMap,
  });
  final String? chatRoomId;
  final Map<String, dynamic>? userMap;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, userMap!['username']),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: firestore
                  .collection("chatroom")
                  .doc(chatRoomId)
                  .collection("chats")
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return Text(snapshot.data?.docs[index]['message']);
                  },
                );
              },
            ),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}

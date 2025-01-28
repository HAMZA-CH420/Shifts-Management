import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/HomeScreen/viewModel/provider/chat_provider.dart';

class MessageInput extends StatelessWidget {
  MessageInput({
    super.key,
    required this.chatRoomId,
    required this.sendBy,
  });
  final String chatRoomId, sendBy;
  final TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Row(
        spacing: 13,
        children: [
          Material(
            elevation: 1.5,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 55,
              width: 310,
              decoration: BoxDecoration(
                color: const Color(0XFFFDFCFF),
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.add_circle_outlined,
                    size: 38,
                    color: Palate.primaryColor,
                  ),
                  border: InputBorder.none,
                  hintText: 'Send Message',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Palate.primaryColor),
                ),
              ),
            ),
          ),
          CircleAvatar(
            radius: 21,
            backgroundColor: Palate.primaryColor,
            child: InkWell(
              onTap: () {
                Provider.of<ChatProvider>(context, listen: false).onSendMessage(
                    chatRoomId, sendBy, messageController.text.toString());
                messageController.clear();
              },
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

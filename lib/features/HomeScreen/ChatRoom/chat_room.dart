import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/HomeScreen/ChatRoom/widgets/appbar.dart';
import 'package:shifts_management/features/HomeScreen/ChatRoom/widgets/message_input.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Palate.primaryColor,
          )),
          MessageInput(),
        ],
      ),
    );
  }
}

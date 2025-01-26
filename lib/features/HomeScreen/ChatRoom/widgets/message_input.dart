import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class MessageInput extends StatelessWidget {
  MessageInput({super.key});
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 55,
              width: 310,
              decoration: const BoxDecoration(
                color: Color(0XFFFDFCFF),
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
              onTap: () {},
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

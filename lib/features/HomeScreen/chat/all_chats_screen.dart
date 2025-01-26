import 'package:flutter/material.dart';

class AllChatsScreen extends StatelessWidget {
  const AllChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          leading: Icon(Icons.account_circle, color: Colors.grey),
          title: Text("John Doe"),
          subtitle: Text("Hello, how are you?"),
          trailing: Text("10:00 AM"),
        );
      },
    ));
  }
}

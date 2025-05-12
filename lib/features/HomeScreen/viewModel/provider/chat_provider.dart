import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ChatProvider extends ChangeNotifier {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  // Constants
  static const String _usersCollection = "users";

  // Method to Create and Get Chat Room ids
  String chatRoomId(String? user1, String? user2) {
    if (user1 != null &&
        user2 != null &&
        user1.isNotEmpty &&
        user2.isNotEmpty) {
      // Compare the entire user IDs for uniqueness
      if (user1.compareTo(user2) > 0) {
        return "$user1$user2";
      } else {
        return "$user2$user1";
      }
    } else {
      debugPrint("Error: user1 or user2 is null or empty");
      return "";
    }
  }

  // Method to get users
  Map<String, dynamic> userMapList = {};
  Future<void> fetchUsers() async {
    try {
      QuerySnapshot querySnapshot =
          await fireStore.collection(_usersCollection).get();
      userMapList = Map.fromEntries(
          querySnapshot.docs.map((doc) => MapEntry(doc.id, doc.data())));
      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching users: $e");
      // Handle the error appropriately, e.g., show an error message to the user
    }
  }

  /// Method to send message to another user
  Future<void> onSendMessage(
    String chatRoomId,
    String sendBy,
    String msg,
  ) async {
    if (msg.isNotEmpty) {
      Map<String, dynamic> message = {
        "sendBy": sendBy,
        "message": msg,
        "time": FieldValue.serverTimestamp(),
      };
      try {
        await fireStore
            .collection('chatroom')
            .doc(chatRoomId)
            .collection('chats')
            .add(message);
      } catch (e) {
        debugPrint("Error sending message: $e");
      }
    } else {
      debugPrint("Message is empty");
    }
  }

  /// Methode to update users Status
  void updateUserStatus(String status) async {
    await fireStore
        .collection(_usersCollection)
        .doc(auth.currentUser?.uid)
        .update({'status': status});
  }
}

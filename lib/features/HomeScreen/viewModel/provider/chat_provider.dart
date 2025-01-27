import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ChatProvider extends ChangeNotifier {
  // Constants
  static const String _usersCollection = "users";

  // Method to Create and Get Chat Room ids
  /// Generates a unique chat room ID based on two user IDs.
  ///
  /// The chat room ID is created by concatenating the two user IDs in
  /// lexicographical order to ensure consistency.
  ///
  /// Returns an empty string if either user ID is null or empty.
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
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot =
          await firestore.collection(_usersCollection).get();
      userMapList = Map.fromEntries(
          querySnapshot.docs.map((doc) => MapEntry(doc.id, doc.data())));
      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching users: $e");
      // Handle the error appropriately, e.g., show an error message to the user
    }
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationServices {
  FirebaseMessaging message = FirebaseMessaging.instance;

  //function to grant permission from user to send notifications

  void notificationPermission() async {
    NotificationSettings settings = await message.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint("Permission Granted by user");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint("User granted provisional permission");
    } else {
      debugPrint("Permission denied by user");
    }
  }
}

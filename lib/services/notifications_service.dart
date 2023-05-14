import 'package:damproject/config/config.dart';
import 'package:flutter/material.dart';

// This code defines a NotificationsService class that provides a convenient way to display snackbars in a Flutter application.
class NotificationsService {
  // A static global key used to access the ScaffoldMessengerState of the current scaffold.
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  // Displays a snackbar with the provided message.
  static showSnackbar(String message) {
    // Creates a SnackBar widget with the specified message and style.
    final snackBar = SnackBar(
      content:
          Text(message, style: const TextStyle(color: white, fontSize: 20)),
    );
    // Shows the snackbar by accessing the current ScaffoldMessengerState using the messengerKey.
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}

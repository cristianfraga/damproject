import 'package:damproject/config/colors.dart';
import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
      content:
          Text(message, style: const TextStyle(color: white, fontSize: 20)),
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}

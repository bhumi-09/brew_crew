import 'package:flutter/material.dart';

class AppSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.red,
    Duration duration = const Duration(seconds: 5),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: behavior,
        duration: duration,
      ),
    );
  }

  static void showError(BuildContext context, String message) {
    show(context, message: message, backgroundColor: Colors.red);
  }

  static void showSuccess(BuildContext context, String message) {
    show(context, message: message, backgroundColor: Colors.green);
  }

 
}

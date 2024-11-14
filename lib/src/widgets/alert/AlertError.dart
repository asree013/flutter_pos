import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class AlertError {
  final String message; // เปลี่ยนชื่อจาก _messsage เป็น message

  const AlertError({required this.message}); // ตั้งชื่อให้เป็น lowercase

  void error(BuildContext context) {
    Flushbar(
      message: message,
      icon: const Icon(
        Icons.error_outline,
        size: 28.0,
        color: const Color.fromARGB(255, 213, 11, 11),
      ),
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: const Color.fromARGB(255, 213, 11, 11),
      margin: const EdgeInsets.all(8),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ).show(context);
  }

  void success(BuildContext context) {
    Flushbar(
      title: message,
      message: "Please Try Again",
      icon: const Icon(
        Icons.check,
        size: 28.0,
        color: Color.fromARGB(255, 11, 89, 51),
      ),
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: const Color.fromARGB(255, 11, 89, 51),
      margin: const EdgeInsets.all(8),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ).show(context);
  }

  void confirm(BuildContext context) {
    
  }
}

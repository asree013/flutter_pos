import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loadding extends StatefulWidget {
  const Loadding({super.key});

  @override
  State<Loadding> createState() => _Loadding();
}

class _Loadding extends State<Loadding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show loading dialog when the button is pressed
            showLoadingDialog(context);

            // Simulate a delay or operation, like logging out
            logout(context);
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }

  // Function to show the loading dialog
  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Disallow dismissing dialog by tapping outside
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  // Function for logout (simulating a task)
  void logout(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a delay (e.g., logging out)

    // Clear shared preferences (simulate logout)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Pop the loading dialog
    Navigator.of(context).pop();

    // Navigate to the login screen after logout
    Navigator.pushReplacementNamed(context, '/login');
  }
}

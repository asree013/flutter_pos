import 'package:flutter/material.dart';

class MyIconWidget extends StatelessWidget {
  const MyIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      
      children: [
        Icon(
          Icons.account_balance
        ),
        Icon(
          Icons.add_alarm
        ),
        Icon(
          Icons.align_vertical_bottom_rounded
        ),
      ],
    );
  }
}
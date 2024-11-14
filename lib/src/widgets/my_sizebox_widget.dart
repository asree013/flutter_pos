import 'package:flutter/material.dart';

class MySizeboxWidget extends StatelessWidget {
  const MySizeboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Text(
        'sizebox',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
      ),
    );
  }
}

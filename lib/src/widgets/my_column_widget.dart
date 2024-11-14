import 'package:flutter/material.dart';

class MyColumnWidget extends StatelessWidget {
  const MyColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget> [
        Text('column 1'),
        Text('column 2'),
        Text('column 3'),
        Text('column 4'),
        Text('column 5'),
        Text('column 6'),
      ],
    );
  }
}
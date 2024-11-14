import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {
  const MyContainer({super.key});

  @override
  State<MyContainer> createState() => _MyContainer();
}

class _MyContainer extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(
          color: Colors.black,
          width: 2
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      width: 148.0,
      height: 148.0,
      child: const Text('box border', textAlign: TextAlign.center),
      
    );
  }
}

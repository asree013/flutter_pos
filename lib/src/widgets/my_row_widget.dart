import 'package:flutter/material.dart';

class MyRowWidget extends StatelessWidget {
  const MyRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('number1', textAlign: TextAlign.center,),
        Text('number2', textAlign: TextAlign.center,),
        // Expanded(child: FittedBox(
        //   child: FlutterLogo(),
        // )),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/assets.dart';

class LogoAppWidget extends StatelessWidget {
  const LogoAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100, bottom: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Enviroments.LOGO_EMS,
            height: 80,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: const Text(
              'EMS App',
              style: TextStyle(
                fontSize: 46.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

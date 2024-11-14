import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleSingOnModel {
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onPressed;

  SingleSingOnModel(
    this.backgroundColor,
    this.icon,
    this.onPressed,
  );
}

class VSingSingOnModel {
  List<SingleSingOnModel> get items => <SingleSingOnModel>[
        SingleSingOnModel(
          const Color(0xFF323232), 
          FontAwesomeIcons.apple,   
          () {                     
                 
          },
        ),
        SingleSingOnModel(
          const Color(0xFFd7483d), 
          FontAwesomeIcons.google,   
          () {                     
                       
          },
        ),
        SingleSingOnModel(
          const Color(0xFF4063ae), 
          FontAwesomeIcons.facebook,   
          () {                     
                       
          },
        ),
        SingleSingOnModel(
          const Color(0xFF21b54b), 
          FontAwesomeIcons.line,   
          () {                     
                       
          },
        ),
      ];
}

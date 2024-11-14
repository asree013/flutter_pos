import 'package:flutter/cupertino.dart';

class Themes {
  const Themes();

  static const Color gradientStart = const Color(0xFF0575E6);
  static const Color gradientEnd = const Color(0xFF021B79);

  static const gradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
  );
}

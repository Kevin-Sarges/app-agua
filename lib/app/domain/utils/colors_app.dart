import 'package:flutter/painting.dart';

class ColorsApp {
  static const bluePrimary = Color(0xFF0178E5);
  static const blueSecondary = Color(0xFF6CB2F2);
  static const blueDarck = Color(0xFF07569D);
  static const blueLight = Color(0xFFE5ECF2);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static const linearGradientBlue = LinearGradient(
    colors: [
      Color(0xFF0178E5),
      Color(0xFF6CB2F2),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

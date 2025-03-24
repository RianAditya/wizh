import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color(0xFF1E80C1);
  static const Color secondaryColor = Color(0xFFf89e23);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color blackGrey = Color.fromARGB(255, 39, 39, 39);
  static const Color backgroundBlack = Color.fromARGB(255, 37, 37, 37);
  static const Color backgroundWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color backgroundGray = Color.fromARGB(255, 240, 240, 240);
  static const Color red = Color(0xFFFF0000);
  static const Color shadowBlack = Color.fromRGBO(0, 0, 0, 0.3);

  static MaterialColor primarySwatch = const MaterialColor(
    0xFF1E80C1,
    {
      50: Color(0xFF8e9fb3),
      100: Color(0xFF778ba3),
      200: Color(0xFF607894),
      300: Color(0xFF496585),
      400: Color(0xFF335175),
      500: Color(0xFF1C3E66),
      600: Color(0xFF19385c),
      700: Color(0xFF163252),
      800: Color(0xFF142b47),
      900: Color(0xFF11253d),
    },
  );
}
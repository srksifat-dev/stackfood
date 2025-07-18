import 'package:flutter/material.dart';

sealed class AppColors extends ThemeExtension<AppColors> {
  const AppColors();

  static const Color transparent = Color(0x00000000);
  static const Color lightBlue = Color.fromARGB(255, 100, 181, 246);
  static const Color deepBlue = Color(0xff337eff);
  static const Color orangeAccent = Color.fromARGB(255, 230, 81, 0);
  static const Color orange = Color.fromARGB(255, 239, 108, 0);
  static const Color borderOutline = Color.fromARGB(165, 58, 58, 58);
  static const Color lightDark = Color.fromARGB(164, 120, 119, 119);
  static const Color dark = Color.fromARGB(255, 58, 58, 58);
  static const Color primaryDarkBlue = Color(0xff1c1e22);
  static const Color grey = Colors.grey;
  static const Color brightGrey = Color.fromARGB(255, 238, 238, 238);
  static const Color emphasizeGrey = Color.fromARGB(255, 97, 97, 97);
  static const Color emphasizeDarkGrey = Color.fromARGB(255, 40, 37, 37);
  static const MaterialColor red = Colors.red;
  static const Color green = Color(0xFF16A554);

  /// The blue primary color and swatch.
  static const Color blue = Color(0xFF347AE6);
  static const Color darkGrey = Color(0xFF2E3B52);
  static const Color midGrey = Color(0xFF6C757D);
  static const Color lightGrey = Color(0xFFCCCCCC);
  static const Color strokeGrey = Color(0xFFCED4DA);
  static const Color pink = Color(0xFFFF0090);
  static const Color purple = Color(0xFF46196E);
  static const Color lightPurple = Color(0xFFF7EEFF);
  static const Color gold = Color(0xFFFA9D28);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color redValidation = Color(0xFFFF3654);
  static const Color yellowValidation = Color(0xFFFCCA46);
}

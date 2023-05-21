import 'package:flutter/material.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkshClr = Color(0xFFff4667);
const Color white = Colors.white;
const Color primaryClr = yellowClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary: white,
    ),
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    colorScheme: const ColorScheme.dark(
      background: darkGreyClr,
      primary: darkGreyClr,
    ),
    brightness: Brightness.dark,
  );
}

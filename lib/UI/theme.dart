import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color blueish = Color(0xFF4e5ae8);
const Color yellowish = Color(0xFFFFB746);
const Color pinkish = Color(0xFFff4667);
const Color white = Colors.white;
const Color darkgrey = Color(0xFF121212);
const Color darkHeader = Color(0xFF424242);
const primaryColor = blueish;

class Themes {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: Colors.white,
      brightness: Brightness.light);
  static final dark = ThemeData(
      backgroundColor: darkgrey,
      primaryColor: darkgrey,
      brightness: Brightness.dark);
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
  ));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[400]));
}
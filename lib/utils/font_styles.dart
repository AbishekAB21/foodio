import 'package:flutter/material.dart';

class FontStyles {
  static TextStyle boldTextStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins");
  }

  static TextStyle headlineTextStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins");
  }

  static TextStyle lightTextStyle() {
    return TextStyle(
        color: Colors.black38,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins");
  }

  static TextStyle SemiBoldTextStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins");
  }

  static TextStyle WhiteTextStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 16.0, fontFamily: "Poppins");
  }

  static TextStyle LogoTextStyle() {
    return TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins",
        color: Colors.white);
  }

  static TextStyle SmallTextFont() {
    return TextStyle(
        fontSize: 12,
        fontFamily: "Poppins",
        color: Colors.black);
  }
}

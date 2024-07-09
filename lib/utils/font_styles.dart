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

  static TextStyle WhiteTextStyle2() {
    return TextStyle(
        color: Colors.white, fontSize: 20.0, fontFamily: "Poppins", fontWeight: FontWeight.bold);
  }

  static TextStyle WhiteTextStyle3() {
    return TextStyle(
        color: Colors.white, fontSize: 25.0, fontFamily: "Poppins", fontWeight: FontWeight.bold);
  }

  static TextStyle SnackBarText() {
    return TextStyle(
        color: Colors.white, fontSize: 14.0, fontFamily: "Poppins");
  }

  static TextStyle LogoTextStyle() {
    return TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: "Poppins",
        color: Colors.white);
  }

  static TextStyle ReallySmallTextFontWhite() {
    return TextStyle(
        fontSize: 10,
        fontFamily: "Poppins",
        color: Colors.white);
  }

  static TextStyle SmallTextFont() {
    return TextStyle(
        fontSize: 12,
        fontFamily: "Poppins",
        color: Colors.black);
  }

  static TextStyle SmallTextFontLight() {
    return TextStyle(
        fontSize: 12,
        fontFamily: "Poppins",
        color: Colors.black54);
  }

   static TextStyle SmallTextFontWithColor() {
    return TextStyle(
        fontSize: 12,
        fontFamily: "Poppins",
        color: const Color.fromARGB(255, 240, 69, 69));
  }

  static TextStyle SomethingInBetween() {
    return TextStyle(
        fontSize: 14,
        fontFamily: "Poppins",
        color: Colors.black);
  }


   static TextStyle MediumTextFont() {
    return TextStyle(
        fontSize: 16,
        fontFamily: "Poppins",
        color: Colors.black);
  }

  static TextStyle MediumTextFontWithColor() {
    return TextStyle(
        fontSize: 16,
        fontFamily: "Poppins",
        color: const Color.fromARGB(255, 240, 69, 69));
  }

 static TextStyle LargeTextFontWithColor() {
    return TextStyle(
        fontSize: 18,
        fontFamily: "Poppins",
        color: const Color.fromARGB(255, 240, 69, 69));
  }
   static TextStyle WarningTextFont() {
    return TextStyle(
        fontSize: 12,
        fontFamily: "Poppins",
        color: Colors.red);
  }
}

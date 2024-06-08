

import 'package:flutter/material.dart';

class FontStyles {

  static TextStyle boldTextStyle(){
    return TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins"
    );
  }

    static TextStyle headlineTextStyle(){
    return TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins"
    );
  }

   static TextStyle lightTextStyle(){
    return TextStyle(
      color: Colors.black38,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins"
    );
  }

   static TextStyle SemiBoldTextStyle(){
    return TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins"
    );
  }
}
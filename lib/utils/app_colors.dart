
import 'package:flutter/material.dart';

AppColor appcolor = AppDefaultColor ();

abstract class AppColor{

  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color LoginGradientColor1;
  final Color LoginGradientColor2;
  final Color SnackBarSuccessColor;
  final Color SnackBarErrorColor;
  final Color borderColor1;
  final Color WalletScreenColor1;

  AppColor({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.LoginGradientColor1,
    required this.LoginGradientColor2,
    required this.SnackBarSuccessColor,
    required this.SnackBarErrorColor,
    required this.borderColor1,
    required this.WalletScreenColor1,
    });
}

class AppDefaultColor extends AppColor{
  AppDefaultColor() :super(

    primaryColor: Colors.white ,
    secondaryColor: Colors.black,
    backgroundColor: Colors.grey.shade200,
    LoginGradientColor1: Color(0xFFff5c30),
    LoginGradientColor2: Color(0xFFe74b1a),
    SnackBarSuccessColor: Colors.green.shade600,
    SnackBarErrorColor: Colors.red.shade700,
    borderColor1: Colors.grey,
    WalletScreenColor1: Color(0xFF008080)
  );
}
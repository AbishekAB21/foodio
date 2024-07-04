
import 'package:flutter/material.dart';

AppColor appcolor = AppDefaultColor ();

abstract class AppColor{

  final Color primaryColor;
  final Color secondaryColor;
  final Color teritiaryColor;
  final Color backgroundColor;
  final Color LoginGradientColor1;
  final Color LoginGradientColor2;
  final Color AdminLoginGradientColor;
  final Color AdminPanelColor1;
  final Color SnackBarSuccessColor;
  final Color SnackBarErrorColor;
  final Color borderColor1;
  final Color WalletScreenColor1;
  final Color StatusColor1;
  final Color DropdownColor1;
  final Color InterfaceIconColor;
  final Color financeColor;
  final Color WariningColor;

  AppColor({
    required this.primaryColor,
    required this.secondaryColor,
    required this.teritiaryColor,
    required this.backgroundColor,
    required this.LoginGradientColor1,
    required this.LoginGradientColor2,
    required this.AdminLoginGradientColor,
    required this.AdminPanelColor1,
    required this.SnackBarSuccessColor,
    required this.SnackBarErrorColor,
    required this.borderColor1,
    required this.WalletScreenColor1,
    required this.DropdownColor1,
    required this.InterfaceIconColor,
    required this.financeColor,
    required this.WariningColor,
    required this.StatusColor1
    });
}

class AppDefaultColor extends AppColor{
  AppDefaultColor() :super(

    primaryColor: Colors.white ,
    secondaryColor: Colors.black,
    teritiaryColor: Color(0xFFededeb),
    backgroundColor: Colors.grey.shade200,
    LoginGradientColor1: Color.fromARGB(255, 240, 93, 83),
    LoginGradientColor2: Color.fromARGB(255, 240, 93, 83),
    AdminLoginGradientColor: Color.fromARGB(255, 53, 51, 51),
    AdminPanelColor1: Color.fromARGB(255, 160, 160, 147),
    SnackBarSuccessColor: Colors.green.shade600,
    SnackBarErrorColor: Colors.red.shade700,
    borderColor1: Colors.grey,
    WalletScreenColor1: Color(0xFF008080),
    DropdownColor1: Color(0xFFececf8),
    InterfaceIconColor: const Color.fromARGB(255, 240, 93, 83),
    financeColor: Colors.blueAccent.shade400,
    WariningColor: Color.fromARGB(246, 235, 153, 12),
    StatusColor1: Colors.yellow.shade700,
  );
}
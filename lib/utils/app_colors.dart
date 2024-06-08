
import 'package:flutter/material.dart';

AppColor appcolor = AppDefaultColor ();

abstract class AppColor{

  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  AppColor({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    });
}

class AppDefaultColor extends AppColor{
  AppDefaultColor() :super(

    primaryColor: Colors.white ,
    secondaryColor: Colors.black,
    backgroundColor: Colors.grey.shade200
  );
}
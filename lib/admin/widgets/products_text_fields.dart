import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class ProductTextFields extends StatelessWidget {
  ProductTextFields(
      {super.key, required this.controller, required this.hintText, required this.maxlines});

  final String hintText;
  final TextEditingController controller;
  final int maxlines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: appcolor.teritiaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxlines,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: FontStyles.lightTextStyle()),
      ),
    );
  }
}

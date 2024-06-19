import 'package:flutter/material.dart';
import 'package:foodio/utils/font_styles.dart';

class ReusableTextFormFields extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final bool isNotVisible;
  final controller;
  final Color? TextColor;
  final String? Function(String?)? validator;
  const ReusableTextFormFields(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.isNotVisible,
      required this.controller,
      this.TextColor,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          color: (TextColor == null) ? Colors.black : TextColor,
          fontFamily: "Poppins"),
      cursorColor:  (TextColor == null) ? Colors.black : TextColor,
      controller: controller,
      obscureText: isNotVisible,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: FontStyles.lightTextStyle(),
        prefixIcon: prefixIcon,
      ),
      validator: validator,
    );
  }
}

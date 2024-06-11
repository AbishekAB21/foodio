import 'package:flutter/material.dart';
import 'package:foodio/utils/font_styles.dart';

class LoginTextFields extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final bool isNotVisible;
  final controller;
  final Color? TextColor;
  final String? Function(String?)? validator;
  const LoginTextFields(
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
      controller: controller,
      obscureText: isNotVisible,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: FontStyles.SemiBoldTextStyle(),
        prefixIcon: prefixIcon,
      ),
      validator: validator,
    );
  }
}

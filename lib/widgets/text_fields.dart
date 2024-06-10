import 'package:flutter/material.dart';
import 'package:foodio/utils/font_styles.dart';

class LoginTextFields extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final bool isNotVisible;
  const LoginTextFields(
      {super.key, required this.hintText, required this.prefixIcon, required this.isNotVisible});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isNotVisible,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: FontStyles.SemiBoldTextStyle(),
          prefixIcon: prefixIcon,
          
          ),
    );
  }
}

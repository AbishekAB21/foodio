import 'package:flutter/material.dart';
import 'package:foodio/utils/font_styles.dart';

class LoginTextFields extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final bool isNotVisible;
  final controller;
  final String? Function(String?)? validator;
  const LoginTextFields(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.isNotVisible,
      required this.controller,
      this.validator
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

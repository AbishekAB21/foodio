import 'package:flutter/material.dart';
import 'package:foodio/pages/sign_up.dart';
import 'package:foodio/utils/app_colors.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ));
      },
      child: Text(
        "Sign Up",
        style: TextStyle(
            fontFamily: "Poppins", color: appcolor.LoginGradientColor2),
      ),
    );
  }
}

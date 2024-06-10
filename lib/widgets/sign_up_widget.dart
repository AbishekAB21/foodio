import 'package:flutter/cupertino.dart';
import 'package:foodio/utils/app_colors.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Text(
        "Sign Up",
        style:
            TextStyle(fontFamily: "Poppins", color: appcolor.LoginGradientColor2),
      ),
    );
  }
}

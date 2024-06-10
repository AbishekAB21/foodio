import 'package:flutter/cupertino.dart';
import 'package:foodio/utils/app_colors.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: appcolor.secondaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Image.asset(
        "assets/google.png",
        height: 10,
        width: 10,
      ),
    );
  }
}

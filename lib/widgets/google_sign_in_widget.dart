import 'package:flutter/material.dart';


class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            
            borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          "assets/google.png",
          height: 10,
          width: 10,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodio/functions/authentication.dart';
import 'package:foodio/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _OnLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
              appcolor.LoginGradientColor1,
              appcolor.LoginGradientColor2
            ])),
        child: Center(
          child: Image.asset(
            "assets/logo.png",
            color: appcolor.primaryColor,
            height: 300,
            width: 300,
          ),
        ),
      ),
    );
  }

  void _OnLoad() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthenticationPage(),
        ));
  }
}

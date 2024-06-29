import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/bottom_nav.dart';
import 'package:lottie/lottie.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({super.key});

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  @override
  void initState() {
    afteLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.LoginGradientColor2,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Order Placed!",
            style: FontStyles.LogoTextStyle(),
          ),
          Text(
            "Thank you for letting us serve you :)",
            style: FontStyles.WhiteTextStyle(),
          ),
          Lottie.asset("animations/Order-Placed.json",
              height: 500, reverse: true, repeat: true, fit: BoxFit.cover)
        ],
      ),
    );
  }

  void afteLoading() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ));
  }
}

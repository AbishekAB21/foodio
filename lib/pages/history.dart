import 'package:flutter/material.dart';
import 'package:foodio/utils/font_styles.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Order History", style: FontStyles.SemiBoldTextStyle(),),
        ),
      ),
    );
  }
}
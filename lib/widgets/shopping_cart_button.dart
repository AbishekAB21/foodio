import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          Icons.shopping_cart_rounded,
          color: appcolor.InterfaceIconColor,
          size: 30,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class PriceFilter extends StatelessWidget {
  String priceFilterAmount;
   PriceFilter({super.key, required this.priceFilterAmount});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: appcolor.InterfaceIconColor),
        child: Center(
            child: Text(
          "< \$"+ priceFilterAmount,
          style: FontStyles.WhiteTextStyle2(),
        )),
      ),
    );
  }
}

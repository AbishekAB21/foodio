import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class SortButton extends StatelessWidget {
  String title;
   SortButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
                  elevation: 2,
                   borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: appcolor.backgroundColor
                    ),
                    child: Text(title, style: FontStyles.SmallTextFont(),),
                  ),
                );
  }
}
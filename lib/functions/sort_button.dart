import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class SortingButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SortingButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          padding: const EdgeInsets.all(10), 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: appcolor.backgroundColor,
          ),
          child: Text(
            title,
            style: FontStyles.SmallTextFont(), 
          ),
        ),
      ),
    );
  }
}

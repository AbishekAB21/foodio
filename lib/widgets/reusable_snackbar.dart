
import 'package:flutter/material.dart';
import 'package:foodio/utils/font_styles.dart';

class ReusableSnackBar {

  showSnackbar(
    BuildContext context,
    String message,
    Color backgroundColor,
    ){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            message,
            style: FontStyles.SnackBarText(),
          ),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ));
  }
}
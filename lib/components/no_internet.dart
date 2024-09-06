import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.signal_wifi_connected_no_internet_4_rounded,
          size: 100,
          color: appcolor.SnackBarErrorColor,
        ),
        SizedBox(height: 10),
        Text(
          "Check your Internet Connection.",
          style: FontStyles.lightTextStyle(),
        ),
      ],
    );
  }
}

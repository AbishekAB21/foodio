import 'package:flutter/material.dart';
import 'package:foodio/utils/font_styles.dart';

class NoResults extends StatelessWidget {
  const NoResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Image.asset(
            "assets/confused.png",
            height: 200,
            width: 200,
          ),
          SizedBox(height: 10),
          Text(
            "No results found :(",
            style: FontStyles.lightTextStyle(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class ProfileScreenTile extends StatelessWidget {
  String imageUrl;
  String title;
  String content;
  ProfileScreenTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: appcolor.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Image.asset(
                imageUrl,
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FontStyles.MediumTextFont(),
                  ),
                  Text(
                    content,
                    style: FontStyles.MediumTextFont(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

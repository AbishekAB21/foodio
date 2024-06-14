import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class AdminHomeTiles extends StatelessWidget {

  final String title;
  final String imageUrl;
  const AdminHomeTiles({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: appcolor.secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Image.asset(
                              imageUrl,
                              height: 104,
                              width: 104,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            title,
                            style: FontStyles.WhiteTextStyle(),
                          )
                        ],
                      ),
                    ),
                  ));
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodio/pages/login.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                height: MediaQuery.of(context).size.height / 4.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: appcolor.secondaryColor,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 105.0))),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 6.5),
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(60),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        "assets/profileIcon.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 70.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("Random User", style: FontStyles.WhiteTextStyle2(),)
                ],
              ),
              )
            ],
          )
        ],
      ),
    ));
  }
}

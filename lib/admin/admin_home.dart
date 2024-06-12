import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodio/admin/add_food.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Admin Home",
                style: FontStyles.headlineTextStyle(),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddFood(),
                    ));
              },
              child: Material(
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
                              "assets/GreekSalad.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Text(
                            "Add Food Item",
                            style: FontStyles.WhiteTextStyle(),
                          )
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

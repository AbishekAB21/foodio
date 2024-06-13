import 'package:flutter/material.dart';
import 'package:foodio/admin/add_food.dart';
import 'package:foodio/admin/edit_menu_screen.dart';
import 'package:foodio/admin/widgets/admin_home_tile.dart';
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
          // Add Food 
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddFood(),
                      ));
                },
                child: AdminHomeTiles(
                  title: "Add Food Item",
                  imageUrl: "assets/GreekSalad.png",
                )),
            SizedBox(height: 10,),
             GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CurrentMenu(),
                      ));
                },
                child: AdminHomeTiles(
                  title: "Edit Current Menu",
                  imageUrl: "assets/onboardingScreen1.png",
                )),
          ],
        ),
      ),
    );
  }
}

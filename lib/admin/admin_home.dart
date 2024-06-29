import 'package:flutter/material.dart';
import 'package:foodio/admin/add_food.dart';
import 'package:foodio/admin/admin_all_orders.dart';
import 'package:foodio/admin/admin_finances.dart';
import 'package:foodio/admin/delete_products_screen.dart';
import 'package:foodio/admin/edit_products_screen.dart';
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
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
                    imageUrl: "assets/chicken.png",
                  )),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeleteProductScreen(),
                        ));
                  },
                  child: AdminHomeTiles(
                    title: "Delete Food Item",
                    imageUrl: "assets/onboardingScreen1.png",
                  )),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditScreen(),
                        ));
                  },
                  child: AdminHomeTiles(
                    title: "Edit Food Item",
                    imageUrl: "assets/drippingPizza.png",
                  )),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Allorders(),
                        ));
                  },
                  child: AdminHomeTiles(
                    title: "All Orders",
                    imageUrl: "assets/checklist.png",
                  )),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FinancesScreen(),
                        ));
                  },
                  child: AdminHomeTiles(
                    title: "Finances",
                    imageUrl: "assets/financial-profit.png",
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

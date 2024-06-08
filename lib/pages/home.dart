import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/category_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello User,",
                  style: FontStyles.boldTextStyle(),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: appcolor.secondaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.shopping_cart_rounded,
                    color: appcolor.primaryColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "The Delicacies We Offer",
              style: FontStyles.headlineTextStyle(),
            ),
            Text(
              "Supress your cravings",
              style: FontStyles.lightTextStyle(),
            ),
            SizedBox(
              height: 30,
            ),
            _buildCategoryButtons(),
            SizedBox(
              height: 20.0,
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/GreekSalad.png",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Greek Salad",
                            style: FontStyles.SemiBoldTextStyle(),
                          ),
                          SizedBox(height: 4.8,),
                          Text(
                            "A tasty Greek Salad",
                            style: FontStyles.lightTextStyle(),
                          ),
                           SizedBox(height: 4.8,),
                           Text(
                            "\$25",
                            style: FontStyles.SemiBoldTextStyle(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _buildCategoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
            onTap: () {},
            child: CategorySelector(imageUrl: "assets/ice-cream.png")),
        GestureDetector(
            onTap: () {},
            child: CategorySelector(imageUrl: "assets/pizza.png")),
        GestureDetector(
            onTap: () {},
            child: CategorySelector(imageUrl: "assets/burger.png")),
        GestureDetector(
            onTap: () {},
            child: CategorySelector(imageUrl: "assets/salads.png")),
      ],
    );
  }
}

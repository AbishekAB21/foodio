import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: appcolor.secondaryColor,
                )),
            Image.asset(
              "assets/GreekSalad.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Text(
                  "Greek Salad",
                  style: FontStyles.SemiBoldTextStyle(),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (count > 1) {
                      --count;
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appcolor.secondaryColor),
                    child: Icon(
                      Icons.remove,
                      color: appcolor.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  count.toString(),
                  style: FontStyles.SemiBoldTextStyle(),
                ),
                SizedBox(
                  width: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    ++count;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appcolor.secondaryColor),
                    child: Icon(
                      Icons.add,
                      color: appcolor.primaryColor,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
              maxLines: 3,
              style: FontStyles.lightTextStyle(),
            ),
            SizedBox(height: 30.0,),
            Row(
              children: [
                Text("Delivery Time", style: FontStyles.SemiBoldTextStyle(),),
                SizedBox(width: 25.0,),
                Icon(Icons.alarm_rounded, color: appcolor.secondaryColor,),
                SizedBox(width: 5.0,),
                Text("30 mins", style: FontStyles.SemiBoldTextStyle(),),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price", style: FontStyles.SemiBoldTextStyle(),),
                      Text("\$25", style: FontStyles.headlineTextStyle(),)
                    ],
                  ),
                  Container(
                    child: Container(
                      width: 150,
                      height: 50,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration( 
                        borderRadius: BorderRadius.circular(8),
                        color: appcolor.secondaryColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        Text("Add To Cart", style: FontStyles.WhiteTextStyle()),
                        SizedBox(width: 10,),
                        Icon(Icons.shopping_cart, color: appcolor.primaryColor,)
                      ],),
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
}

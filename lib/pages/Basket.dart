import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 6),
          padding: EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 2.0,
                shadowColor: appcolor.secondaryColor,
                child: Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                      "Basket",
                      style: FontStyles.headlineTextStyle(),
                    ))),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 40,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text("2")),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            "assets/GreekSalad.png",
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            Text(
                              "Greek Salad",
                              style: FontStyles.SemiBoldTextStyle(),
                            ),
                            Text(
                              "\$40",
                              style: FontStyles.SemiBoldTextStyle(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price",
                      style: FontStyles.boldTextStyle(),
                    ),
                    Text(
                      "\$120",
                      style: FontStyles.SemiBoldTextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: appcolor.secondaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    "Checkout",
                    style: FontStyles.WhiteTextStyle2(),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

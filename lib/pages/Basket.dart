import 'package:flutter/material.dart';
import 'package:foodio/provider/basket_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BasketProvider>(
      builder: (context, provider, child) {
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
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                   height: MediaQuery.of(context).size.height/2,
                    child: Expanded(
                      child: StreamBuilder(
                        stream: provider.foodCartStream,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            provider.calculateGrandTotal(snapshot.data.docs);
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: snapshot.data.docs.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                DocumentSnapshot ds = snapshot.data.docs[index];
                                return Container(
                                  margin: EdgeInsets.only(
                                      left: 20.0, right: 20.0, bottom: 10.0),
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 118,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      // Increase Quantity
                                                    },
                                                    icon: Icon(
                                                      Icons.add_rounded,
                                                      color:
                                                          appcolor.secondaryColor,
                                                    )),
                                                Text(ds["Quantity"]),
                                                IconButton(
                                                    onPressed: () {
                                                      // Decrease Quantity
                                                    },
                                                    icon: Icon(
                                                        Icons.remove_rounded,
                                                        color: appcolor
                                                            .secondaryColor)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: Image.network(
                                              ds["Image"],
                                              height: 90,
                                              width: 90,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ds["Name"],
                                                  overflow: TextOverflow.ellipsis,
                                                  style: FontStyles
                                                      .SemiBoldTextStyle(),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "\$" + ds["Total"],
                                                      style: FontStyles
                                                          .SemiBoldTextStyle(),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Image.asset(
                                                          "assets/delete.png",
                                                          height: 20,
                                                          width: 20,
                                                        ))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                color: appcolor.LoginGradientColor2,
                              ),
                            );
                          }
                        },
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
                          "\$" + provider.grandtotal.toString(),
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

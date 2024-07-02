import 'package:flutter/material.dart';
import 'package:foodio/pages/checkout.dart';
import 'package:foodio/provider/basket_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

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
                  Expanded(
                    child: StreamBuilder(
                      stream: provider.foodCartStream,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Lottie.asset(
                              "animations/Loading.json",
                              height: 400,
                              width: 400,
                              repeat: true,
                            ),
                          );
                        }
                        if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Image.asset("assets/empty.png",
                                    height: 300, width: 400),
                                SizedBox(height: 30),
                                Text(
                                  "Your Basket's empty :(",
                                  style: FontStyles.lightTextStyle(),
                                ),
                              ],
                            ),
                          );
                        }

                        if (snapshot.hasData) {
                          provider.calculateGrandTotal(snapshot.data.docs);
                          return Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: snapshot.data.docs.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot ds =
                                        snapshot.data.docs[index];
                                    int quantity = int.parse(ds["Quantity"]);
                                    double pricePerItem =
                                        double.parse(ds["Total"]) / quantity;

                                    return Container(
                                      margin: EdgeInsets.only(
                                          left: 20.0,
                                          right: 20.0,
                                          bottom: 10.0),
                                      child: Material(
                                        elevation: 5.0,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 118,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    border: Border.all(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          provider
                                                              .updateQuantity(
                                                            ds.id,
                                                            quantity + 1,
                                                            pricePerItem,
                                                          );
                                                        },
                                                        icon: Icon(
                                                          Icons.add_rounded,
                                                          color: appcolor
                                                              .secondaryColor,
                                                        )),
                                                    Text(quantity.toString()),
                                                    IconButton(
                                                        onPressed: () {
                                                          provider
                                                              .updateQuantity(
                                                            ds.id,
                                                            quantity - 1,
                                                            pricePerItem,
                                                          );
                                                        },
                                                        icon: Icon(
                                                            Icons
                                                                .remove_rounded,
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: FontStyles
                                                          .SemiBoldTextStyle(),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "\$" +
                                                              ds["Total"]
                                                                  .toString(),
                                                          style: FontStyles
                                                              .SemiBoldTextStyle(),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                    content: Text(
                                                                        "Are you sure you want to delete this item ?"),
                                                                    title: Text(
                                                                        "Deleting Cart Item"),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    backgroundColor:
                                                                        appcolor
                                                                            .primaryColor,
                                                                    actions: [
                                                                      TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            "Cancel",
                                                                            style:
                                                                                FontStyles.SmallTextFont(),
                                                                          )),
                                                                      TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            provider.deleteCartItem(
                                                                                ds.id,
                                                                                context,
                                                                                ds["Name"]);
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            "Delete",
                                                                            style:
                                                                                FontStyles.SmallTextFont(),
                                                                          ))
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
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
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CheckOutScreen(),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
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
                              ),
                            ],
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodio/pages/address.dart';
import 'package:foodio/widgets/checkout_build.dart';
import 'package:provider/provider.dart';
import 'package:foodio/provider/checkout_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Checkout", style: FontStyles.headlineTextStyle()),
        backgroundColor: Colors.transparent,
      ),
      body: ChangeNotifierProvider(
        create: (_) => CheckoutProvider(),
        child: Consumer<CheckoutProvider>(
          builder: (context, provider, child) {
            return Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder(
                      stream: provider.foodCartStream,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: appcolor.LoginGradientColor2,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else if (!snapshot.hasData ||
                            snapshot.data.docs.isEmpty) {
                          return Center(
                            child: Text('No items in the cart'),
                          );
                        } else {
                          // Calculate grand total
                          provider.calculateGrandTotal(snapshot.data.docs);

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: snapshot.data.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds = snapshot.data.docs[index];
                              return CheckoutItemsBuilder(ds: ds);
                            },
                          );
                        }
                      },
                    ),
                  ),
                  Divider(),
                  if (provider.defaultAddress != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Deliver to: ${provider.defaultAddress!["Name"]}",
                                style: FontStyles.MediumTextFont(),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddressScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Change Delivery Address",
                                  style: FontStyles.SmallTextFontWithColor(),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Price",
                                style: FontStyles.boldTextStyle(),
                              ),
                              Text(
                                "\$" + provider.grandTotal.toString(),
                                style: FontStyles.SemiBoldTextStyle(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  if (provider.defaultAddress == null)
                    CircularProgressIndicator(
                      color: appcolor.InterfaceIconColor,
                    ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Integrate Payment Gateway using razorpay

                      /* 
                      The amount displayed as the grandtotal should be passed into the payment 
                      gateway.
                      */

                      /* After the payment is complete, sent details of the order 
                     like the name quantity and price, a hardcodded order status "Ordered"
                     also pass the current date and store it as a string. 

                     all this should be stored in a new collection under "users" collection
                     called "Orders"

                     also to another collection outside "users" collection called "All orders",
                     that has all the same data as the "orders" but additionally it should also
                     have the user's name and city as a string. This can be fetched from the 
                     DefaultaddressStream in the checkout provider

                     "All orders" can be accessed by the Admin and "Orders by the user"
                     */
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: appcolor.secondaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "Proceed to Payment",
                            style: FontStyles.WhiteTextStyle2(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

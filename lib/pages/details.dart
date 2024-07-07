import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/provider/details_provider.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  final String image, name, description, price;

  DetailsScreen({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailsProvider(price),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          title: Text(
            name,
            style: FontStyles.SemiBoldTextStyle(),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            Consumer<DetailsProvider>(
              builder: (context, provider, child) {
                return IconButton(
                  onPressed: () async {
                    await provider.addToFavorites(name, description, image, context);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: appcolor.SnackBarErrorColor,
                  ),
                );
              },
            ),
          ],
        ),
        body: Consumer<DetailsProvider>(
          builder: (context, provider, child) {
            return Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      image,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text(name,
                            style: FontStyles.SemiBoldTextStyle(),
                            overflow: TextOverflow.clip),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          provider.decrementCount(int.parse(price));
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
                      SizedBox(width: 10.0),
                      Text(
                        provider.count.toString(),
                        style: FontStyles.SemiBoldTextStyle(),
                      ),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          provider.incrementCount(int.parse(price));
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
                  SizedBox(height: 20.0),
                  Text(
                    description,
                    maxLines: 3,
                    style: FontStyles.lightTextStyle(),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    children: [
                      Text(
                        "Delivery Time",
                        style: FontStyles.SemiBoldTextStyle(),
                      ),
                      SizedBox(width: 25.0),
                      Icon(
                        Icons.alarm_rounded,
                        color: appcolor.secondaryColor,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        "30 mins",
                        style: FontStyles.SemiBoldTextStyle(),
                      ),
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
                            Text(
                              "Total Price",
                              style: FontStyles.SemiBoldTextStyle(),
                            ),
                            Text(
                              "\$${provider.total}",
                              style: FontStyles.headlineTextStyle(),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            await provider.addToCart(name, image, context);
                          },
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
                                Text("Add To Cart",
                                    style: FontStyles.WhiteTextStyle()),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.shopping_cart,
                                  color: appcolor.primaryColor,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

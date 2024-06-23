import 'package:flutter/material.dart';
import 'package:foodio/services/database.dart';
import 'package:foodio/services/shared_pref.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  String image, name, description, price;
  DetailsScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.description,
      required this.price});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int count = 1, total = 0;
  String? id;
  bool filled = false;

  getSharedpref() async {
    id = await SharedPrefHelper().getUserId();
    print("User ID fetched: $id"); // Debug print
    if (id != null) {
      setState(() {});
    }
  }

  ontheLoad() async {
    await getSharedpref();
    setState(() {});
  }

  @override
  void initState() {
    total = int.parse(widget.price);
    super.initState();
    ontheLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        title: Text(
          widget.name,
          style: FontStyles.SemiBoldTextStyle(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () async {
                Map<String, dynamic> addToFavorites = {
                  "Name": widget.name,
                  "Quantity": count.toString(),
                  "Total": total.toString(),
                  "Image": widget.image
                };
                try {
                  await DatabaseMethods()
                      .addFoodToFavourites(addToFavorites, id!);
                  filled = true;
                  ReusableSnackBar().showSnackbar(
                      context,
                      "${count} Item has been added to favorites",
                      appcolor.SnackBarSuccessColor);
                } catch (e) {
                  ReusableSnackBar().showSnackbar(
                      context,
                      "Error adding item to favorites: $e",
                      appcolor.SnackBarErrorColor);
                  print("Error adding item to favorites: $e");
                }
              },
              icon: Icon(
                Icons.favorite,
                color: appcolor.SnackBarErrorColor,
              ))
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Text(
                  widget.name,
                  style: FontStyles.SemiBoldTextStyle(),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (count > 1) {
                      --count;
                      total = total - int.parse(widget.price);
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
                    total = total + int.parse(widget.price);
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
              widget.description,
              maxLines: 3,
              style: FontStyles.lightTextStyle(),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Text(
                  "Delivery Time",
                  style: FontStyles.SemiBoldTextStyle(),
                ),
                SizedBox(
                  width: 25.0,
                ),
                Icon(
                  Icons.alarm_rounded,
                  color: appcolor.secondaryColor,
                ),
                SizedBox(
                  width: 5.0,
                ),
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
                        "\$" + total.toString(),
                        style: FontStyles.headlineTextStyle(),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      Map<String, dynamic> FoodToBeAdded = {
                        "Name": widget.name,
                        "Quantity": count.toString(),
                        "Total": total.toString(),
                        "Image": widget.image
                      };

                      try {
                        await DatabaseMethods()
                            .addFoodToCart(FoodToBeAdded, id!);
                        ReusableSnackBar().showSnackbar(
                            context,
                            "${count} Items have been added to your cart",
                            appcolor.SnackBarSuccessColor);
                      } catch (e) {
                        ReusableSnackBar().showSnackbar(
                            context,
                            "Error adding to cart: $e",
                            appcolor.SnackBarErrorColor);
                        print("Error adding to cart: $e");
                      }
                    },
                    child: Container(
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
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.shopping_cart,
                              color: appcolor.primaryColor,
                            )
                          ],
                        ),
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
}

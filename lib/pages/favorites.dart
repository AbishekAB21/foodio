import 'package:flutter/material.dart';
import 'package:foodio/pages/details.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:foodio/provider/favorites_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  Widget favoriteItems(BuildContext context) {
    final provider = Provider.of<FavoritesProvider>(context);

    return StreamBuilder(
      stream: provider.favoriteStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: appcolor.LoginGradientColor2,
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error loading favorites",
              style: FontStyles.SmallTextFont(),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
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
                Image.asset(
                  "assets/hungrycat.png",
                  height: 300,
                  width: 300,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "You haven't marked any favourites yet.",
                  style: FontStyles.lightTextStyle(),
                )
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                          name: ds["Name"],
                          image: ds["Image"],
                          description: ds["Description"],
                          price: ds["Total"]),
                    ));
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ds["Name"],
                                style: FontStyles.SemiBoldTextStyle(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$" + ds["Total"],
                                    style: FontStyles.SemiBoldTextStyle(),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                                "Are you sure you want to delete this item?"),
                                            title:
                                                Text("Deleting from favorites"),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor:
                                                appcolor.primaryColor,
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Cancel",
                                                  style: FontStyles
                                                      .SmallTextFont(),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  provider.deleteFavoriteItem(
                                                      ds.id,
                                                      context,
                                                      ds["Name"]);
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Delete",
                                                  style: FontStyles
                                                      .SmallTextFont(),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: Image.asset(
                                      "assets/delete.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Your favourites",
            style: FontStyles.SemiBoldTextStyle(),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: favoriteItems(context),
            ),
          ],
        ),
      ),
    );
  }
}

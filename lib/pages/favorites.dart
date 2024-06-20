import 'package:flutter/material.dart';
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
        if (snapshot.hasData) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.docs[index];
              return Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
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
                                            title: Text("Deleting from favorites"),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)),
                                            backgroundColor: appcolor.primaryColor,
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Cancel",
                                                  style: FontStyles.SmallTextFont(),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  provider.deleteFavoriteItem(ds.id, context, ds["Name"]);
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Delete",
                                                  style: FontStyles.SmallTextFont(),
                                                ),
                                              )
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
            "Your Favorites",
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

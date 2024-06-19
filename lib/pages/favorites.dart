import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodio/services/database.dart';
import 'package:foodio/services/shared_pref.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  String? id;

  getThesharedpref() async {
    id = await SharedPrefHelper().getUserId();
    setState(() {});
  }

  ontheLoad() async {
    await getThesharedpref();
    foodCartStream = await DatabaseMethods().getFavorites(id!);
    setState(() {});
  }

  @override
  void initState() {
    ontheLoad();
    super.initState();
  }

  Stream? foodCartStream;

  Widget favoriteItems() {
    return StreamBuilder(
        stream: foodCartStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
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
                )
              : CircularProgressIndicator(
                  color: appcolor.LoginGradientColor2,
                );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: favoriteItems(),
          ),
        ],
      ),
    );
  }
}

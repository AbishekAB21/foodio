import 'package:flutter/material.dart';
import 'package:foodio/provider/home_screen_provider.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:foodio/pages/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VerticalItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);

    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        if (provider.foodItemsStream == null) {
          return Center(
            child: Lottie.asset(
              "animations/Loading.json",
              height: 100,
              width: 100,
              repeat: true,
            ),
          );
        }

        return StreamBuilder(
          stream: provider.foodItemsStream,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Lottie.asset(
                  "animations/Loading.json",
                  height: 400,
                  width: 400,
                  repeat: true,
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data.docs.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        name: ds["Name"],
                        description: ds["Description"],
                        image: ds["Image"],
                        price: ds["Price"],
                      ),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(right: 20.0, bottom: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                ds["Image"],
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    ds["Name"],
                                    style: FontStyles.SemiBoldTextStyle(),
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    ds["Description"],
                                    style: FontStyles.lightTextStyle(),
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "\$" + ds["Price"],
                                    style: FontStyles.SemiBoldTextStyle(),
                                  ),
                                ),
                              ],
                            )
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
      },
    );
  }
}

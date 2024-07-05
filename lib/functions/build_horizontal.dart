import 'package:flutter/material.dart';
import 'package:foodio/provider/home_screen_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:provider/provider.dart';
import 'package:foodio/pages/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HorizontalItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);

    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        if (provider.foodItemsStream == null) {
          return Center(
            child: CircularProgressIndicator(
              color: appcolor.LoginGradientColor2,
            ),
          );
        }

        return StreamBuilder(
          stream: provider.foodItemsStream,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: appcolor.LoginGradientColor2,
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
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
                    margin: const EdgeInsets.all(5),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 200,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                ds["Image"],
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              ds["Name"],
                              style: FontStyles.SemiBoldTextStyle(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4.8),
                            Text(
                              "\$" + ds["Price"],
                              style: FontStyles.SemiBoldTextStyle(),
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
      },
    );
  }
}

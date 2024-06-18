import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodio/pages/favorites.dart';
import 'package:foodio/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:foodio/pages/details.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/category_selector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger initial data load
    final homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.getFoodItems("Pizza");

    return SafeArea(
      child: Scaffold(
        backgroundColor: appcolor.primaryColor,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 50, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello User,",
                      style: FontStyles.boldTextStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FavoritesScreen(),
                            ));
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Image.asset(
                            "assets/wishlist.png",
                            height: 30,
                            width: 30,
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "The Delicacies We Offer",
                  style: FontStyles.headlineTextStyle(),
                ),
                Text(
                  "Supress your cravings",
                  style: FontStyles.lightTextStyle(),
                ),
                const SizedBox(
                  height: 30,
                ),
                _buildCategoryButtons(),
                const SizedBox(
                  height: 20.0,
                ),
                Container(height: 270, child: allItems(context)),
                const SizedBox(
                  height: 10.0,
                ),
                allItemsVertically(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => provider.getFoodItems("Ice-cream"),
              child: CategorySelector(imageUrl: "assets/icecream2.png"),
            ),
            GestureDetector(
              onTap: () => provider.getFoodItems("Pizza"),
              child: CategorySelector(imageUrl: "assets/pizza2.png"),
            ),
            GestureDetector(
              onTap: () => provider.getFoodItems("Burger"),
              child: CategorySelector(imageUrl: "assets/burger2.png"),
            ),
            GestureDetector(
              onTap: () => provider.getFoodItems("Salad"),
              child: CategorySelector(imageUrl: "assets/vegan.png"),
            ),
          ],
        );
      },
    );
  }

  Widget allItems(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        if (provider.foodItemsStream == null) {
          return CircularProgressIndicator(
            color: appcolor.LoginGradientColor2,
          );
        }

        return StreamBuilder(
          stream: provider.foodItemsStream,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator(
                color: appcolor.LoginGradientColor2,
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
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            ),
                            const SizedBox(
                              height: 4.8,
                            ),
                            Text(
                              ds["Description"],
                              style: FontStyles.lightTextStyle(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 4.8,
                            ),
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

  Widget allItemsVertically(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        if (provider.foodItemsStream == null) {
          return CircularProgressIndicator(
            color: appcolor.LoginGradientColor2,
          );
        }

        return StreamBuilder(
          stream: provider.foodItemsStream,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator(
                color: appcolor.LoginGradientColor2,
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
                            const SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    ds["Name"],
                                    style: FontStyles.SemiBoldTextStyle(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    ds["Description"],
                                    style: FontStyles.lightTextStyle(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
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

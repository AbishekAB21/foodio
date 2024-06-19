import 'package:flutter/material.dart';
import 'package:foodio/functions/build_horizontal.dart';
import 'package:foodio/functions/build_vertical.dart';
import 'package:foodio/provider/home_screen_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/search_box.dart';
import 'package:provider/provider.dart';
import 'package:foodio/widgets/category_selector.dart';
import 'package:foodio/pages/favorites.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.getFoodItems("Pizza");

    return SafeArea(
      child: Scaffold(
        backgroundColor: appcolor.primaryColor,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 10, left: 20),
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
                            builder: (context) => const FavoritesScreen(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.asset(
                          "assets/wishlist.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "The Delicacies We Offer",
                  style: FontStyles.headlineTextStyle(),
                ),
                Text(
                  "Suppress your cravings",
                  style: FontStyles.lightTextStyle(),
                ),
                const SizedBox(height: 30),
                SearchBox(
                  searchController: _searchController,
                  onSearchChanged: (value) {
                    if (value.isNotEmpty) {
                      homeScreenProvider.searchFoodItems(value);
                    } else {
                      homeScreenProvider.getFoodItems(homeScreenProvider
                          .currentCategory); // Use the current category
                    }
                  },
                ),
                const SizedBox(height: 30),
                _buildCategoryButtons(),
                const SizedBox(height: 20.0),
                Container(height: 270, child: HorizontalItemList()),
                const SizedBox(height: 10.0),
                VerticalItemList(),
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
}

import 'package:flutter/material.dart';
import 'package:foodio/components/no_internet.dart';
import 'package:foodio/components/shimmer.dart';
import 'package:foodio/controllers/network_controller.dart';
import 'package:foodio/functions/category_buttons.dart';
import 'package:foodio/pages/Basket.dart';
import 'package:foodio/provider/home_screen_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/search_box.dart';
import 'package:foodio/widgets/shopping_cart_button.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    NetworkController networkController = Get.find();
    final homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.getFoodItems("Pizza");

    return SafeArea(
      child: Scaffold(
        backgroundColor: appcolor.primaryColor,
        body: Obx(() {
          return networkController.connectionStatus.value == "Offline"
              ? Center(
                  child: NoInternet(),
                )
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Consumer<HomeScreenProvider>(
                              builder: (context, provider, child) {
                                return Text(
                                  provider.name == null
                                      ? "Hello User!"
                                      : "Hello ${provider.name}!",
                                  style: FontStyles.boldTextStyle(),
                                );
                              },
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BasketScreen(),
                                  ),
                                );
                              },
                              child: ShoppingCartButton(),
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
                              homeScreenProvider.getFoodItems(
                                  homeScreenProvider.currentCategory);
                            }
                          },
                        ),
                        const SizedBox(height: 30),
                        CategoryButtons(), 
                        const SizedBox(height: 20.0),
                        ShowShimmer(), 
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}

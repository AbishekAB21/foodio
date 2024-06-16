import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodio/pages/home.dart';
import 'package:foodio/pages/order.dart';
import 'package:foodio/pages/profile.dart';
import 'package:foodio/pages/wallet.dart';
import 'package:foodio/provider/bottom_nav_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(),
      Order(),
      WalletScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: Consumer<BottomNavBarProvider>(
        builder: (context, provider, child) {
          return CurvedNavigationBar(
            height: 65,
            backgroundColor: appcolor.primaryColor,
            color: appcolor.secondaryColor,
            animationDuration: Duration(milliseconds: 500),
            onTap: (int index) {
              provider.setTabIndex(index);
            },
            items: [
              Icon(
                Icons.home_rounded,
                color: appcolor.primaryColor,
              ),
              Icon(
                Icons.shopping_cart_rounded,
                color: appcolor.primaryColor,
              ),
              Icon(
                Icons.history_rounded,
                color: appcolor.primaryColor,
              ),
              Icon(
                Icons.person_rounded,
                color: appcolor.primaryColor,
              ),
            ],
          );
        },
      ),
      body: Consumer<BottomNavBarProvider>(
        builder: (context, provider, child) {
          return pages[provider.currentTabIndex];
        },
      ),
    );
  }
}

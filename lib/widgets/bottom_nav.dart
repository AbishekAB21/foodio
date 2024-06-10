import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodio/pages/home.dart';
import 'package:foodio/pages/order.dart';
import 'package:foodio/pages/profile.dart';
import 'package:foodio/pages/wallet.dart';
import 'package:foodio/utils/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late HomeScreen homepage;
  late ProfileScreen profilepage;
  late Order orderpage;
  late WalletScreen walletpage;

  @override
  void initState() {
    homepage = HomeScreen();
    profilepage = ProfileScreen();
    orderpage = Order();
    walletpage = WalletScreen();
    pages = [homepage, orderpage, walletpage, profilepage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: appcolor.backgroundColor,
          color: appcolor.secondaryColor,
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
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
              Icons.wallet_rounded,
              color: appcolor.primaryColor,
            ),
            Icon(
              Icons.person_rounded,
              color: appcolor.primaryColor,
            ),
          ]),
      body: pages[currentTabIndex],
    );
  }
}

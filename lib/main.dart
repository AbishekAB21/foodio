import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodio/admin/provider/finance_provider.dart';
import 'package:foodio/admin/provider/product_provider.dart';
import 'package:foodio/controllers/network_controller.dart';
import 'package:foodio/pages/splash.dart';
import 'package:foodio/provider/address_provider.dart';
import 'package:foodio/provider/auth_provider.dart';
import 'package:foodio/provider/basket_provider.dart';
import 'package:foodio/provider/bottom_nav_provider.dart';
import 'package:foodio/provider/checkout_provider.dart';
import 'package:foodio/provider/favorites_provider.dart';
import 'package:foodio/provider/home_screen_provider.dart';
import 'package:foodio/provider/profile_provider.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(  
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider(),),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider(),),
        ChangeNotifierProvider(create: (context) => ProfileProvider(),),
        ChangeNotifierProvider(create: (context) => BasketProvider(),),
        ChangeNotifierProvider(create: (context) => FavoritesProvider(),),
        ChangeNotifierProvider(create: (context) => AddressProvider(),),
        ChangeNotifierProvider(create: (context) => CheckoutProvider(),),
        ChangeNotifierProvider(create: (context) => FinancesProvider(),)
      ],
      child: const MyApp(), 
    ), 
  );
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NetworkController(), permanent: true);
    return MaterialApp(
      home:SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

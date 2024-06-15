import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodio/admin/provider/product_provider.dart';
import 'package:foodio/functions/authentication.dart';
import 'package:foodio/pages/splash.dart';
import 'package:foodio/provider/auth_provider.dart';
import 'package:foodio/provider/bottom_nav_provider.dart';
import 'package:foodio/widgets/bottom_nav.dart';
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
      ],
      child: const MyApp(), 
    ), 
  );
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

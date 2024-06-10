import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodio/pages/login.dart';
import 'package:foodio/pages/onboard.dart';
import 'package:foodio/provider/bottom_nav_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => BottomNavBarProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
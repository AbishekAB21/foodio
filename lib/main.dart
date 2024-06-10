import 'package:flutter/material.dart';
import 'package:foodio/pages/login.dart';
import 'package:foodio/provider/bottom_nav_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => BottomNavBarProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
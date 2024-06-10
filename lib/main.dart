import 'package:flutter/material.dart';
import 'package:foodio/provider/bottom_nav_provider.dart';
import 'package:foodio/widgets/bottom_nav.dart';
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
      home: BottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
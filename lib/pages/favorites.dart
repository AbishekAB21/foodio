import 'package:flutter/material.dart';
import 'package:foodio/utils/font_styles.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your Favorites",
          style: FontStyles.SemiBoldTextStyle(),
        ),
      ),
    );
  }
}

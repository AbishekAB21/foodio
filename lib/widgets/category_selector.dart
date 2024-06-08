import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {

  final String imageUrl;
  const CategorySelector({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Material(
      
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Image.asset(
          imageUrl,
          height: 40,
          width: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

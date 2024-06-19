import 'package:flutter/material.dart';
import 'package:foodio/services/database.dart';

class HomeScreenProvider extends ChangeNotifier {
  Stream? _foodItemsStream;
  Stream? get foodItemsStream => _foodItemsStream;

  String _currentCategory = "Pizza"; // Default category
  String get currentCategory => _currentCategory;

  Future<void> getFoodItems(String category) async {
    _currentCategory = category;
    _foodItemsStream = await DatabaseMethods().getFoodItem(category);
    notifyListeners();
  }

  Future<void> searchFoodItems(String query) async {
    _foodItemsStream = await DatabaseMethods().searchFoodItem(_currentCategory, query);
    notifyListeners();
  }
}

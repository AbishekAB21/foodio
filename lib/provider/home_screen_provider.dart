import 'package:flutter/material.dart';
import 'package:foodio/services/database.dart';

class HomeScreenProvider extends ChangeNotifier {
  Stream? _foodItemsStream;

  Stream? get foodItemsStream => _foodItemsStream;

  Future<void> getFoodItems(String category) async {
    _foodItemsStream = await DatabaseMethods().getFoodItem(category);
    notifyListeners();
  }
}

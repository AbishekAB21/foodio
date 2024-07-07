import 'package:flutter/material.dart';
import 'package:foodio/services/database.dart';
import 'package:foodio/services/shared_pref.dart';

class HomeScreenProvider extends ChangeNotifier {
  Stream? _foodItemsStream;
  Stream? get foodItemsStream => _foodItemsStream;

  bool _noSearchResults = false;
  bool get noSearchResults => _noSearchResults;

  String _currentCategory = "Pizza"; // Default category
  String get currentCategory => _currentCategory;
  String? name;

  HomeScreenProvider(){
    getSharedPref();
  }

  Future<void> getFoodItems(String category) async {
    _currentCategory = category;
    _foodItemsStream = await DatabaseMethods().getFoodItem(category);
    _noSearchResults = false; // Reset the no results flag
    notifyListeners();
  }

  Future<void> searchFoodItems(String query) async {
    _foodItemsStream = await DatabaseMethods().searchFoodItem(_currentCategory, query);
    _foodItemsStream!.listen((snapshot) {
      if (snapshot.docs.isEmpty) {
        _noSearchResults = true;
      } else {
        _noSearchResults = false;
      }
      notifyListeners();
    });
  }

  getSharedPref() async {
    name = await SharedPrefHelper().getUserName();
    notifyListeners();
  }
}

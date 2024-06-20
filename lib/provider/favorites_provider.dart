import 'package:flutter/material.dart';
import 'package:foodio/services/database.dart';
import 'package:foodio/services/shared_pref.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';

class FavoritesProvider with ChangeNotifier {
  String? id;
  Stream? favoriteStream;

  FavoritesProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    await _getSharedPref();
    favoriteStream = await DatabaseMethods().getFavorites(id!);
    notifyListeners();
  }

  Future<void> _getSharedPref() async {
    id = await SharedPrefHelper().getUserId();
    notifyListeners();
  }

  Future<void> deleteFavoriteItem(String itemId, BuildContext context, String itemName) async {
    try {
      await DatabaseMethods().deleteFavoriteItems(id!, itemId);
      ReusableSnackBar().showSnackbar(
        context,
        "$itemName deleted from favorites",
        appcolor.LoginGradientColor2,
      );
      notifyListeners();
    } catch (e) {
      ReusableSnackBar().showSnackbar(
        context,
        "Error deleting item: $e",
        appcolor.SnackBarErrorColor,
      );
      print("Error deleting item: $e");
    }
  }
}

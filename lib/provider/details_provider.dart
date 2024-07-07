import 'package:flutter/material.dart';
import 'package:foodio/services/database.dart';
import 'package:foodio/services/shared_pref.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';

class DetailsProvider extends ChangeNotifier {
  int count = 1;
  int total = 0;
  String? id;
  bool filled = false;

  DetailsProvider(String price) {
    total = int.parse(price);
    onLoad();
  }

  Future<void> onLoad() async {
    await getSharedPref();
    notifyListeners();
  }

  Future<void> getSharedPref() async {
    id = await SharedPrefHelper().getUserId();
    print("User ID fetched: $id"); // Debug print
    notifyListeners();
  }

  void incrementCount(int price) {
    count++;
    total += price;
    notifyListeners();
  }

  void decrementCount(int price) {
    if (count > 1) {
      count--;
      total -= price;
      notifyListeners();
    }
  }

  Future<void> addToFavorites(String name, String description, String image,
      BuildContext context) async {
    Map<String, dynamic> addToFavorites = {
      "Name": name,
      "Description": description,
      "Quantity": count.toString(),
      "Total": total.toString(),
      "Image": image
    };
    try {
      await DatabaseMethods().addFoodToFavourites(addToFavorites, id!);
      filled = true;
       ReusableSnackBar().showSnackbar(
          context,
          "${count} Items have been added to favourites",
          appcolor.SnackBarSuccessColor);
    } catch (e) {
      ReusableSnackBar().showSnackbar(
          context, "Error adding to cart: $e", appcolor.SnackBarErrorColor);
      print("Error adding to favourites: $e");
      print("Error adding item to favorites: $e");
    }
    notifyListeners();
  }

  Future<void> addToCart(
      String name, String image, BuildContext context) async {
    Map<String, dynamic> FoodToBeAdded = {
      "Name": name,
      "Quantity": count.toString(),
      "Total": total.toString(),
      "Image": image
    };

    try {
      await DatabaseMethods().addFoodToCart(FoodToBeAdded, id!);
      ReusableSnackBar().showSnackbar(
          context,
          "${count} Items have been added to your cart",
          appcolor.SnackBarSuccessColor);
    } catch (e) {
      ReusableSnackBar().showSnackbar(
          context, "Error adding to cart: $e", appcolor.SnackBarErrorColor);
      print("Error adding to cart: $e");
    }
  }
}

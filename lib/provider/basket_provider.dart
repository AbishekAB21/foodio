import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodio/services/database.dart';
import 'package:foodio/services/shared_pref.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';

class BasketProvider with ChangeNotifier {
  String? id;
  int grandtotal = 0;
  Stream? foodCartStream;

  BasketProvider() {
    ontheLoad();
    startTimer();
  }

  Future<void> getThesharedpref() async {
    id = await SharedPrefHelper().getUserId();
    notifyListeners();
  }

  Future<void> ontheLoad() async {
    await getThesharedpref();
    foodCartStream = await DatabaseMethods().getFoodCartItems(id!);
    notifyListeners();
  }

  void startTimer() {
    Timer(Duration(seconds: 2), () {
      notifyListeners();
    });
  }

  void calculateGrandTotal(List<DocumentSnapshot> docs) {
    grandtotal = 0; // Reset the grand total
    for (var doc in docs) {
      grandtotal += int.parse(doc["Total"]);
    }
    notifyListeners();
  }

  Future<void> deleteCartItem(String itemId, BuildContext context, String itemName) async {
    try {
      await DatabaseMethods().deleteCartItems(id!, itemId);
      notifyListeners();
      ReusableSnackBar().showSnackbar(context, "Deleted $itemName from the cart", appcolor.LoginGradientColor2);
    } catch (e) {
      ReusableSnackBar().showSnackbar(context, "Error deleting item: $e", appcolor.SnackBarErrorColor);
    }
  }
}

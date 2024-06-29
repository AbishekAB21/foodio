import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodio/pages/order_placed.dart';
import 'package:foodio/services/database.dart';
import 'package:foodio/services/shared_pref.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';

class CheckoutProvider with ChangeNotifier {
  String? id;
  double grandTotal = 0.0;
  Stream<QuerySnapshot>? foodCartStream;
  Map<String, dynamic>? defaultAddress;

  CheckoutProvider() {
    ontheLoad();
  }

  Future<void> getThesharedpref() async {
    id = await SharedPrefHelper().getUserId();
    notifyListeners();
  }

  Future<void> ontheLoad() async {
    await getThesharedpref();
    if (id != null) {
      foodCartStream = await DatabaseMethods().getFoodCartItems(id!);
      await _initialize(); // Fetch default address when loading
      notifyListeners();
    }
  }

  void calculateGrandTotal(List<DocumentSnapshot> docs) {
    grandTotal = 0.0; // Reset the grand total
    for (var doc in docs) {
      grandTotal += double.parse(doc["Total"]);
    }
    notifyListeners();
  }

  Future<void> updateQuantity(
      String cartItemId, int newQuantity, double pricePerItem) async {
    if (newQuantity < 1) return;

    double newTotal = newQuantity * pricePerItem;

    await DatabaseMethods().updateCartItem(id!, cartItemId, {
      "Quantity": newQuantity.toString(),
      "Total":
          newTotal.toStringAsFixed(2) // Ensure the total is stored as a string
    });
    notifyListeners();
  }

  Future<void> deleteCartItem(
      String itemId, BuildContext context, String itemName) async {
    try {
      await DatabaseMethods().deleteCartItems(id!, itemId);
      notifyListeners();
      ReusableSnackBar().showSnackbar(context,
          "Deleted $itemName from the cart", appcolor.LoginGradientColor2);
    } catch (e) {
      ReusableSnackBar().showSnackbar(
          context, "Error deleting item: $e", appcolor.SnackBarErrorColor);
    }
  }

  Future<void> _initialize() async {
    if (id != null) {
      DocumentSnapshot doc = await DatabaseMethods().getDefaultAddress(id!);
      if (doc.exists) {
        defaultAddress = doc.data() as Map<String, dynamic>?;
        notifyListeners();
      }
    }
  }

  // Add a method to update the default address
  Future<void> updateDefaultAddress(String addressId) async {
    if (id != null) {
      await DatabaseMethods().setDefaultAddress(id!, addressId);
      // After updating, fetch the updated default address
      await _initialize();
      notifyListeners();
    }
  }

  Future<void> placeOrder(BuildContext context) async {
    try {
      if (id == null || defaultAddress == null) return;

      // Fetch cart items
      QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(id)
          .collection("Cart")
          .get();

      List<Map<String, dynamic>> cartItems = cartSnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      // Create order data
      Map<String, dynamic> orderData = {
        "items": cartItems,
        "total": grandTotal,
        "status": "Ordered",
        "orderDate": DateTime.now(),
        "deliveryAddress": defaultAddress
      };

      // Save order data to user's orders collection
      await FirebaseFirestore.instance
          .collection("users")
          .doc(id)
          .collection("Orders")
          .add(orderData);

      // Save order data to admin's all orders collection
      Map<String, dynamic> adminOrderData = {
        ...orderData,
        "userName": defaultAddress!["Name"],
        "userCity": defaultAddress!["City"],
      };

      await FirebaseFirestore.instance
          .collection("AllOrders")
          .add(adminOrderData);

      // Clear cart
      for (var doc in cartSnapshot.docs) {
        await doc.reference.delete();
      }

      // Show success message
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OrderPlacedScreen(),
          ));
    } catch (e) {
      // Show error message
      ReusableSnackBar().showSnackbar(
          context, "Error placing order: $e", appcolor.SnackBarErrorColor);
    }
  }
}

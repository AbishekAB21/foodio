import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllOrdersProvider with ChangeNotifier {
  List<Map<String, dynamic>> orders = [];

  AllOrdersProvider() {
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
   
   /* 
   Get all the data stored in "AllOrders" collection and convert it to a list 
   and store it in "orders[]".

   Then access this "orders[]" list in the Admin_All_orders screen to display
   the data.
   */
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("AllOrders").get();
      orders = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      notifyListeners();
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }
}

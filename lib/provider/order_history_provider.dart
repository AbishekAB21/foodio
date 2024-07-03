import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodio/services/shared_pref.dart';

class OrderHistoryProvider with ChangeNotifier {
  String? id;
  List<Map<String, dynamic>> orders = [];
  List<Map<String, dynamic>> filteredOrders = [];
  String currentFilter = "All Time";

  OrderHistoryProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    await getThesharedpref();
    if (id != null) {
      await fetchOrders();
    }
  }

  Future<void> getThesharedpref() async {
    id = await SharedPrefHelper().getUserId();
    notifyListeners();
  }

  Future<void> fetchOrders() async {
    if (id == null) return;

    try {
      QuerySnapshot orderSnapshot = await FirebaseFirestore.instance
          .collection("AllOrders")
          .where("userId", isEqualTo: id)
          .get();

      orders = orderSnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      applyFilter(currentFilter); // Apply the initial filter

      notifyListeners();
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }

  void applyFilter(String filter) {
    currentFilter = filter;
    DateTime now = DateTime.now();

    filteredOrders = orders.where((order) {
      DateTime orderDate = (order['orderDate'] as Timestamp).toDate();
      if (filter == "Today") {
        return orderDate.year == now.year &&
            orderDate.month == now.month &&
            orderDate.day == now.day;
      } else if (filter == "This Month") {
        return orderDate.year == now.year && orderDate.month == now.month;
      } else if (filter == "This Year") {
        return orderDate.year == now.year;
      } else {
        return true; // All Time
      }
    }).toList();

    // Sorting the filtered orders based on date (Latest to Old)
    filteredOrders.sort(
        (a, b) => b['orderDate'].toDate().compareTo(a['orderDate'].toDate()));
    notifyListeners();
  }
}

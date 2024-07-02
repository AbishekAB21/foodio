import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          .collection("users")
          .doc(id)
          .collection("Orders")
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

    /* 
    The Object "filteredorders" will store the orders according to
    the filters.

    The where function is used to filter out the orders based on
    the sort buttons
    */
    filteredOrders = orders.where((order) {
      DateTime orderDate = (order['orderDate'] as Timestamp).toDate();
      if (filter == "Today") {
        return orderDate.year == now.year && // current year
            orderDate.month == now.month && // current month
            orderDate.day == now.day; // current day
      } else if (filter == "This Month") {
        return orderDate.year == now.year && // current year
            orderDate.month == now.month; // current month
      } else if (filter == "This Year") {
        return orderDate.year == now.year; // current year
      } else {
        return true; // All Time
      }
    }).toList();

    // Sorting the filtered orders based on date (Latest to Old)
    filteredOrders.sort(
        (a, b) => b['orderDate'].toDate().compareTo(a['orderDate'].toDate()));
    notifyListeners();
  }

  // void sortOrders(String filter) {
  //   applyFilter(filter);
  // }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllOrdersProvider with ChangeNotifier {
  List<Map<String, dynamic>> orders = [];
  List<Map<String, dynamic>> filteredOrders = [];
  String currentFilter = "All Time";

  AllOrdersProvider() {
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("AllOrders").get();
      orders = snapshot.docs
          .map((doc) => {
                ...doc.data() as Map<String, dynamic>,
                'orderId': doc.id, // Include the orderId
              })
          .toList();
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
    notifyListeners();
  }

  Future<void> updateOrderStatus(String orderId, String newStatus) async {
    try {
      // Update the status in the AllOrders collection
      await FirebaseFirestore.instance
          .collection("AllOrders")
          .doc(orderId)
          .update({"status": newStatus});

      // Update the local state
      orders = orders.map((order) {
        if (order['orderId'] == orderId) {
          return {...order, 'status': newStatus};
        }
        return order;
      }).toList();

      applyFilter(currentFilter); // Reapply the current filter to update filteredOrders

      notifyListeners();
    } catch (e) {
      print("Error updating order status: $e");
    }
  }
}

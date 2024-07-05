import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FinancesProvider with ChangeNotifier {
  double totalEarnings = 0.0;
  String selectedTimeFrame = "All Time";

  FinancesProvider() {
    fetchTotalEarnings("All Time");
  }

  Future<void> fetchTotalEarnings(String timeFrame) async {
    double total = 0.0;
    DateTime now = DateTime.now();
    QuerySnapshot querySnapshot;

    switch (timeFrame) {
      case "Today":
        DateTime startOfDay = DateTime(now.year, now.month, now.day);
        querySnapshot = await FirebaseFirestore.instance
            .collection("AllOrders")
            .where("orderDate", isGreaterThanOrEqualTo: startOfDay)
            .get();
        break;
      case "This Month":
        DateTime startOfMonth = DateTime(now.year, now.month, 1);
        querySnapshot = await FirebaseFirestore.instance
            .collection("AllOrders")
            .where("orderDate", isGreaterThanOrEqualTo: startOfMonth)
            .get();
        break;
      case "This Year":
        DateTime startOfYear = DateTime(now.year, 1, 1);
        querySnapshot = await FirebaseFirestore.instance
            .collection("AllOrders")
            .where("orderDate", isGreaterThanOrEqualTo: startOfYear)
            .get();
        break;
      case "All Time":
      default:
        querySnapshot =
            await FirebaseFirestore.instance.collection("AllOrders").get();
        break;
    }

    for (var doc in querySnapshot.docs) {
      total += double.parse(doc["total"].toString());
    }

    totalEarnings = total;
    selectedTimeFrame = timeFrame;
    notifyListeners();
  }

  void onSortButtonPressed(String timeFrame) {
    fetchTotalEarnings(timeFrame);
  }
}

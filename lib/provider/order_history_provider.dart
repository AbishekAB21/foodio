import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodio/services/shared_pref.dart';

class OrderHistoryProvider with ChangeNotifier {
  String? id;
  List<Map<String, dynamic>> orders = [];

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

    QuerySnapshot orderSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("Orders")
        .get();

    orders = orderSnapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();

    notifyListeners();
  }
}

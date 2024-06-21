import 'package:flutter/material.dart';
import 'package:foodio/services/database.dart';
import 'package:foodio/services/shared_pref.dart';

class AddressProvider with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController houseController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  
  String? id;
  Stream? addressStream;
  String? defaultAddressId;

  AddressProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    id = await SharedPrefHelper().getUserId();
    addressStream = await DatabaseMethods().getAddresses(id!);
    notifyListeners();
  }

  Future<void> addAddress(Map<String, dynamic> addressMap) async {
    if (id != null) {
      try {
        await DatabaseMethods().addAddress(addressMap, id!);
        clearControllers();
        notifyListeners();
      } catch (e) {
        print("Error adding Address: $e");
      }
    }
  }

  Future<void> setDefaultAddress(String addressId) async {
    if (id != null) {
      await DatabaseMethods().setDefaultAddress(id!, addressId);
      defaultAddressId = addressId;
      notifyListeners();
    }
  }

  Future<void> deleteAddress(String addressId) async {
    if (id != null) {
      await DatabaseMethods().deleteAddress(id!, addressId);
      notifyListeners();
    }
  }

  void clearControllers() {
    nameController.clear();
    houseController.clear();
    cityController.clear();
    pinController.clear();
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:foodio/services/database.dart';

class ProductProvider with ChangeNotifier {
  Stream? foodItemsStream;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  XFile? get imageFile => _imageFile;

  Future<void> loadFoodItems(String category) async {
    foodItemsStream = await DatabaseMethods().getFoodItem(category);
    notifyListeners();
  }

  Future<void> pickImage() async {
    _imageFile = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> updateProduct(DocumentSnapshot ds, String category, TextEditingController nameController, TextEditingController descriptionController, TextEditingController priceController, String imageUrl) async {
    if (_imageFile != null) {
      imageUrl = await DatabaseMethods().uploadImage(File(_imageFile!.path));
    }
    await FirebaseFirestore.instance.collection(category).doc(ds.id).update({
      "Name": nameController.text,
      "Description": descriptionController.text,
      "Price": priceController.text,
      "Image": imageUrl,
    });
    notifyListeners();
  }

  Future<void> deleteProduct(String documentId, String category) async {
    await FirebaseFirestore.instance.collection(category).doc(documentId).delete();
    notifyListeners();
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseMethods {
  Future adduserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  Future addFoodItem(Map<String, dynamic> itemInfoMap, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(itemInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future<String> uploadImage(File imageFile) async {
    try {
      // Generate a unique file name
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Reference to the Firebase Storage
      Reference storageReference =
          FirebaseStorage.instance.ref().child("foodImages/$fileName");

      // Upload the file to Firebase Storage
      UploadTask uploadTask = storageReference.putFile(imageFile);

      // Wait for the upload to complete
      TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});

      // Get the download URL of the uploaded file
      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future addFoodToCart(Map<String, dynamic> cartFood, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('Cart')
        .add(cartFood);
  }
}

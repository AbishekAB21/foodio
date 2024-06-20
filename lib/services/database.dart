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

  Future addFoodToFavourites(
      Map<String, dynamic> favouriteFood, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('Favorites')
        .add(favouriteFood);
  }

  Future addAddress(Map<String, dynamic> address, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('Address')
        .add(address);
  }

  Future<Stream<QuerySnapshot>> getFoodCartItems(String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("Cart")
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getFavorites(String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("Favorites")
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getAddresses(String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("Address")
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> searchFoodItem(
      String category, String query) async {
    return FirebaseFirestore.instance
        .collection(category) // use category as the collection name
        .where('Name', isGreaterThanOrEqualTo: query)
        .where('Name', isLessThanOrEqualTo: query + '\uf8ff')
        .snapshots();
  }

  Future<void> deleteAddress(String userId, String addressId) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("Address")
        .doc(addressId)
        .delete();
  }

  Future<void> deleteCartItems(String userId, String cartItemId) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("Cart")
        .doc(cartItemId)
        .delete();
  }

  Future<void> deleteFavoriteItems(String userId, String favoriteItemId) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("Favorites")
        .doc(favoriteItemId)
        .delete();
  }
}

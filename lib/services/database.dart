import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future adduserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }


  Future addFoodItem(Map<String, dynamic> itemInfoMap, String name) async {
    return await FirebaseFirestore.instance
        .collection(name)
        .add(itemInfoMap);
  }
}

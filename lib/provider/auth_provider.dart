import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodio/services/database.dart';
import 'package:foodio/services/shared_pref.dart';
import 'package:foodio/widgets/bottom_nav.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:random_string/random_string.dart';
import 'package:foodio/admin/admin_home.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logIn(String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
      ReusableSnackBar().showSnackbar(
          context, "Logged In successfully", appcolor.SnackBarSuccessColor);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'invalid-email') {
        ReusableSnackBar().showSnackbar(
            context, "User not found", appcolor.SnackBarErrorColor);
      } else if (e.code == 'wrong-password') {
        ReusableSnackBar().showSnackbar(
            context, "Incorrect Password", appcolor.SnackBarErrorColor);
      } else {
        ReusableSnackBar()
            .showSnackbar(context, "${e.code}", appcolor.SnackBarErrorColor);
      }
    }
  }

  Future<void> signUp(String email, String password, String name, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      ReusableSnackBar().showSnackbar(context, "Account created successfully!",
          appcolor.SnackBarSuccessColor);

      // Saving details to firestore
      String Id = randomAlphaNumeric(10);
      Map<String, dynamic> addUserInfo = {
        "Name": name,
        "Email": email,
        "Id": Id,
      };
      await DatabaseMethods().adduserDetails(addUserInfo, Id);
      
      // Saving User details locally
      await SharedPrefHelper().saveUserName(name);
      await SharedPrefHelper().saveUserEmail(email);
      await SharedPrefHelper().saveUserId(Id);

      // Navigating to HomeScreen
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavBar(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        ReusableSnackBar().showSnackbar(
            context, "Weak Password", appcolor.SnackBarErrorColor);
      } else if (e.code == "email-already-in-use") {
        ReusableSnackBar().showSnackbar(
            context,
            "Account already exists - Try logging in",
            appcolor.SnackBarErrorColor);
      }
    }
  }

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      ReusableSnackBar().showSnackbar(context,
          "Password reset mail has been sent", appcolor.LoginGradientColor1);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        ReusableSnackBar().showSnackbar(
            context, "User not found", appcolor.SnackBarErrorColor);
      } else {
        ReusableSnackBar()
            .showSnackbar(context, "${e.code}", appcolor.SnackBarErrorColor);
      }
    }
  }

  Future<void> adminLogin(String username, String password, BuildContext context) async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection("Admin").get();
      for (var result in snapshot.docs) {
        if (result.data()['id'] != username) {
          ReusableSnackBar().showSnackbar(
              context, "Incorrect Username", appcolor.SnackBarErrorColor);
          return;
        } else if (result.data()['password'] != password) {
          ReusableSnackBar().showSnackbar(
              context, "Incorrect Password", appcolor.SnackBarErrorColor);
          return;
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AdminHomeScreen()),
          );
          ReusableSnackBar().showSnackbar(
              context, "Signed in as Admin", appcolor.secondaryColor);
          return;
        }
      }
    } catch (e) {
      ReusableSnackBar().showSnackbar(
          context, "Error logging in", appcolor.SnackBarErrorColor);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}

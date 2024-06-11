import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodio/widgets/bottom_nav.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';
import 'package:foodio/utils/app_colors.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logIn(
      String email, String password, BuildContext context) async {
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
        ReusableSnackBar().showSnackbar(
            context, "${e.code}", appcolor.SnackBarErrorColor);
      }
    }
  }

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavBar(),
          ));
      ReusableSnackBar().showSnackbar(context, "Account created successfully!",
          appcolor.SnackBarSuccessColor);
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

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodio/pages/onboard.dart';
import 'package:foodio/widgets/bottom_nav.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is already logged in
          if (snapshot.hasData) {
            return BottomNavBar();
          }

          // user hasn't logged in
          else {
            return OnboardScreen();
          }
        },
      ),
    );;
  }
}
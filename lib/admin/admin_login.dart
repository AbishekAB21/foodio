import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodio/admin/admin_home.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';
import 'package:foodio/widgets/text_fields.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.teritiaryColor,
      body: Container(
        child: Stack(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      appcolor.AdminLoginGradientColor,
                      appcolor.secondaryColor
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(
                          MediaQuery.of(context).size.width, 110))),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Center(
                      child: Image.asset(
                        "assets/logo.png",
                        color: appcolor.secondaryColor,
                        width: MediaQuery.of(context).size.width /5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10,),
                      Text(
                        "Admin",
                        style: FontStyles.headlineTextStyle(),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2.2,
                          decoration: BoxDecoration(
                            color: appcolor.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: LoginTextFields(
                                    hintText: "Username",
                                    TextColor: appcolor.secondaryColor,
                                    prefixIcon: Icon(Icons.shield_sharp),
                                    isNotVisible: false,
                                    controller: userNameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Username";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                margin: EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: LoginTextFields(
                                    hintText: "Password",
                                    TextColor: appcolor.secondaryColor,
                                    prefixIcon: Icon(Icons.password_rounded),
                                    isNotVisible: true,
                                    controller: userPasswordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Password";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70.0,
                              ),
                              GestureDetector(
                                onTap: () => adminLogin(),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 40.0),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: appcolor.secondaryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      "Log In",
                                      style: FontStyles.WhiteTextStyle2(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  adminLogin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['id'] != userNameController.text.trim()) {
          ReusableSnackBar().showSnackbar(
              context, "Incorrect Username", appcolor.SnackBarErrorColor);
        } else if (result.data()['password'] !=
            userPasswordController.text.trim()) {
          ReusableSnackBar().showSnackbar(
              context, "Incorrect Password", appcolor.SnackBarErrorColor);
        } else {
          Route route = MaterialPageRoute(
            builder: (context) => AdminHomeScreen(),
          );
          Navigator.pushReplacement(context, route);
          ReusableSnackBar().showSnackbar(
              context, "Signed in as Admin", appcolor.secondaryColor);
        }
      });
    });
  }
}

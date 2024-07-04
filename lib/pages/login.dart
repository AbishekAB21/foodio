import 'package:flutter/material.dart';
import 'package:foodio/admin/admin_login.dart';
import 'package:foodio/pages/forgot_password.dart';
import 'package:foodio/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/text_fields.dart';
import 'package:foodio/pages/sign_up.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      appcolor.LoginGradientColor1,
                      appcolor.LoginGradientColor2,
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                decoration: BoxDecoration(
                  color: appcolor.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Text(""),
              ),
              Container(
                margin: EdgeInsets.only(top: 60.0, left: 20, right: 20),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/logo.png",
                        color: appcolor.primaryColor,
                        width: MediaQuery.of(context).size.width / 4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text("Foodio", style: FontStyles.LogoTextStyle()),
                    SizedBox(height: 20),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: appcolor.primaryColor,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Text("Login",
                                  style: FontStyles.headlineTextStyle()),
                              LoginTextFields(
                                controller: emailController,
                                isNotVisible: false,
                                hintText: "E-mail",
                                prefixIcon: Icon(Icons.email_rounded),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your e-mail";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 30),
                              LoginTextFields(
                                controller: passwordController,
                                isNotVisible: true,
                                hintText: "Password",
                                prefixIcon: Icon(Icons.password_rounded),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your password";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordScreen(),
                                      ));
                                },
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "Forgot Password?",
                                    style: FontStyles.SmallTextFont(),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    authProvider.logIn(
                                      emailController.text,
                                      passwordController.text,
                                      context,
                                    );
                                  }
                                },
                                child: Material(
                                  elevation: 0.5,
                                  child: Container(
                                    width: 150,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: appcolor.LoginGradientColor2,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Log In",
                                        style: FontStyles.WhiteTextStyle(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: FontStyles.SmallTextFont(),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUpPage()),
                                      );
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: appcolor.LoginGradientColor2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) =>
                              //               AdminLoginScreen(),
                              //         ));
                              //   },
                              //   child: Material(
                              //       child: Container(
                              //     height: 40,
                              //     width: 100,
                              //     decoration: BoxDecoration(
                              //         color: appcolor.secondaryColor,
                              //         borderRadius: BorderRadius.circular(10)),
                              //     child: Center(
                              //         child: Text(
                              //       "Admin",
                              //       style: FontStyles.WhiteTextStyle(),
                              //     )),
                              //   )),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

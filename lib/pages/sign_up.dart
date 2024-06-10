import 'package:flutter/material.dart';
import 'package:foodio/pages/login.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/text_fields.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
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
                      appcolor.LoginGradientColor2
                    ])),
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
                        topRight: Radius.circular(40))),
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
                    )),
                    Text("Foodio", style: FontStyles.LogoTextStyle()),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: appcolor.primaryColor),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Sign Up",
                              style: FontStyles.headlineTextStyle(),
                            ),
                            LoginTextFields(
                                isNotVisible: false,
                                hintText: "Name",
                                prefixIcon: Icon(Icons.list_alt_rounded)),
                            SizedBox(
                              height: 30,
                            ),
                            LoginTextFields(
                                isNotVisible: false,
                                hintText: "E- mail",
                                prefixIcon: Icon(Icons.email_rounded)),
                            SizedBox(
                              height: 30,
                            ),
                            LoginTextFields(
                                isNotVisible: true,
                                hintText: "Password",
                                prefixIcon: Icon(Icons.password_rounded)),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Material(
                              elevation: 0.5,
                              child: Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: appcolor.LoginGradientColor2,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  "Sign Up",
                                  style: FontStyles.WhiteTextStyle(),
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account ? ",
                                  style: FontStyles.SmallTextFont(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  },
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: appcolor.LoginGradientColor2),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}

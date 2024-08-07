import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodio/pages/address.dart';
import 'package:foodio/pages/terms_and_conditions.dart';
import 'package:foodio/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/text_fields.dart';
import 'package:foodio/pages/login.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool acceptTerms = false;

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
                        height: 530,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: appcolor.primaryColor,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Text("Sign Up",
                                  style: FontStyles.headlineTextStyle()),
                              LoginTextFields(
                                controller: nameController,
                                isNotVisible: false,
                                hintText: "Name",
                                prefixIcon: Icon(Icons.list_alt_rounded),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your name";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 30),
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
                              CheckboxListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      "I accept ",
                                      style: FontStyles.SmallTextFont(),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TermsAndConditions(),
                                          )),
                                      child: Text(
                                        "terms and conditions",
                                        style:
                                            FontStyles.SmallTextFontWithColor(),
                                      ),
                                    )
                                  ],
                                ),
                                value: acceptTerms,
                                onChanged: (newValue) {
                                  setState(() {
                                    acceptTerms = newValue!;
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                              SizedBox(height: 20),
                              Visibility(
                                visible: acceptTerms,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        if (_formKey.currentState!.validate() &&
                                            acceptTerms) {
                                          await authProvider.signUp(
                                            emailController.text,
                                            passwordController.text,
                                            nameController.text,
                                            context,
                                          );

                                          // Show alert dialog after successful sign-up
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                backgroundColor:
                                                    appcolor.primaryColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                title: Text(
                                                  "Make sure to add an address",
                                                  style: FontStyles
                                                      .SemiBoldTextStyle(),
                                                ),
                                                content: Text(
                                                  "You've successfully signed up! Add your address now.",
                                                  style: FontStyles
                                                      .MediumTextFont(),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    child: Text(
                                                      "Add Address",
                                                      style: FontStyles
                                                          .MediumTextFontWithColor(),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              AddressScreen(), // Replace with your address screen
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else if (!acceptTerms) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    "Please accept terms and conditions")),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Sign Up",
                                              style:
                                                  FontStyles.WhiteTextStyle(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
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
                                            builder: (context) =>
                                                LoginScreen()),
                                      );
                                    },
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: appcolor.LoginGradientColor2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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

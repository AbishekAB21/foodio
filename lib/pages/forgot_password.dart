import 'package:flutter/material.dart';
import 'package:foodio/pages/sign_up.dart';
import 'package:foodio/provider/auth_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';
import 'package:foodio/widgets/text_fields.dart';
import 'package:provider/provider.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: appcolor.primaryColor),
      ),
      backgroundColor: appcolor.secondaryColor,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Password Recovery",
                style: FontStyles.WhiteTextStyle2(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter you e-mail",
              style: FontStyles.WhiteTextStyle(),
            ),
            Expanded(
              child: Form(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: appcolor.primaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: LoginTextFields(
                          TextColor: appcolor.primaryColor,
                          hintText: "E-Mail",
                          prefixIcon: Icon(Icons.mail_rounded),
                          isNotVisible: false,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter you email";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          final email = emailController.text;
                          if (email.isNotEmpty) {
                            context.read<AuthenticationProvider>().resetPassword(email, context);
                          } else {
                            ReusableSnackBar().showSnackbar(context, "Please enter your email", appcolor.SnackBarErrorColor);
                          }
                        },
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: appcolor.primaryColor),
                            child: Center(
                              child: Text(
                                "Reset Password",
                                style: FontStyles.SemiBoldTextStyle(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Don't have an account ? ",
                        style: FontStyles.WhiteTextStyle(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up!",
                          style: FontStyles.WhiteTextStyle2(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

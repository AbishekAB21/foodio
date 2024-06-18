import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodio/admin/widgets/profile_alert_box.dart';
import 'package:foodio/admin/widgets/profile_screen_tiles.dart';
import 'package:foodio/pages/address.dart';
import 'package:foodio/pages/history.dart';
import 'package:foodio/pages/login.dart';
import 'package:foodio/provider/profile_provider.dart';
import 'package:foodio/services/auth.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: provider.name == null
              ? CircularProgressIndicator(
                  color: appcolor.LoginGradientColor2,
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: 45.0, left: 20.0, right: 20.0),
                            height: MediaQuery.of(context).size.height / 4.3,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: appcolor.secondaryColor,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.elliptical(
                                  MediaQuery.of(context).size.width,
                                  105.0,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 6.5,
                              ),
                              child: Material(
                                elevation: 10.0,
                                borderRadius: BorderRadius.circular(60),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: provider.selectedImage == null
                                      ? GestureDetector(
                                          onTap: () {
                                            provider.getImage();
                                          },
                                          child: provider.profile == null
                                              ? Image.asset(
                                                  "assets/profileIcon.png",
                                                  height: 120,
                                                  width: 120,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.network(
                                                  provider.profile!,
                                                  height: 120,
                                                  width: 120,
                                                  fit: BoxFit.cover,
                                                ),
                                        )
                                      : Image.file(
                                          provider.selectedImage!,
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 70.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  provider.name!,
                                  style: FontStyles.WhiteTextStyle2(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      ProfileScreenTile(
                        imageUrl: "assets/profileIcon.png",
                        title: "Name",
                        content: provider.name!,
                      ),
                      SizedBox(height: 10.0),
                      ProfileScreenTile(
                        imageUrl: "assets/email.png",
                        title: "E-Mail",
                        content: provider.email!,
                      ),
                      SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddressScreen(),
                            ),
                          );
                        },
                        child: ProfileScreenTile(
                          imageUrl: "assets/address.png",
                          title: "Address",
                          content: "Add delete or edit your address",
                        ),
                      ),
                      SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderHistory(),
                            ),
                          );
                        },
                        child: ProfileScreenTile(
                          imageUrl: "assets/history.png",
                          title: "Orders",
                          content: "User's order history",
                        ),
                      ),
                      SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () async {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ProfileAlertBox(
                                content:
                                    "Are you sure that you want to log out?",
                                actionButtonText: "Log out",
                                onpressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: ProfileScreenTile(
                          imageUrl: "assets/log-out.png",
                          title: "Log Out",
                          content: "Logs out off this account",
                        ),
                      ),
                      SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => ProfileAlertBox(
                              content:
                                  "Are you sure you want to delete your account?",
                              actionButtonText: "Delete",
                              onpressed: () {
                                AuthMethods().deleteAccount();
                              },
                            ),
                          );
                        },
                        child: ProfileScreenTile(
                          imageUrl: "assets/delete.png",
                          title: "Delete",
                          content: "Deletes your account",
                        ),
                      ),
                      SizedBox(height: 10.0),
                      ProfileScreenTile(
                        imageUrl: "assets/terms-and-conditions.png",
                        title: "Terms and Conditions",
                        content: "App policy and details",
                      ),
                      SizedBox(height: 30),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Foodio- Savor the Speed, Taste the Difference",
                          style: FontStyles.lightTextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

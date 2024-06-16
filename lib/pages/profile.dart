import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodio/admin/widgets/profile_alert_box.dart';
import 'package:foodio/admin/widgets/profile_screen_tiles.dart';
import 'package:foodio/pages/login.dart';
import 'package:foodio/services/shared_pref.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? profile, name, email;
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectedImage = File(image!.path);
    setState(() {
      uploadDetails();
    });
  }

  uploadDetails() async {
    if (selectedImage != null) {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("blogImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();

      await SharedPrefHelper().saveUserProfile(downloadUrl);
      setState(() {});
    }
  }

  getSharedPref() async {
    profile = await SharedPrefHelper().getUserProfile();
    name = await SharedPrefHelper().getUserName();
    email = await SharedPrefHelper().getUserEmail();
    setState(() {});
  }

  onTheLoad() async {
    await getSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    onTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: name == null
            ? CircularProgressIndicator(
                color: appcolor.LoginGradientColor2,
              )
            : SingleChildScrollView(
                child: Container(
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
                                        105.0))),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height / 6.5),
                              child: Material(
                                elevation: 10.0,
                                borderRadius: BorderRadius.circular(60),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: selectedImage == null
                                      ? GestureDetector(
                                          onTap: () {
                                            getImage();
                                          },
                                          child: profile == null
                                              ? Image.asset(
                                                  "assets/profileIcon.png",
                                                  height: 120,
                                                  width: 120,
                                                  fit: BoxFit.cover)
                                              : Image.network(
                                                  profile!,
                                                  height: 120,
                                                  width: 120,
                                                  fit: BoxFit.cover,
                                                ),
                                        )
                                      : Image.file(selectedImage!,
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
                                  name!,
                                  style: FontStyles.WhiteTextStyle2(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ProfileScreenTile(
                          imageUrl: "assets/profileIcon.png",
                          title: "Name",
                          content: name!),
                      SizedBox(
                        height: 10.0,
                      ),
                      ProfileScreenTile(
                          imageUrl: "assets/email.png",
                          title: "E-Mail",
                          content: email!),
                      SizedBox(
                        height: 10.0,
                      ),
                      ProfileScreenTile(
                          imageUrl: "assets/history.png",
                          title: "Orders",
                          content: "User's order history"),
                      SizedBox(
                        height: 10.0,
                      ),
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
                                      ));
                                },
                              );
                            },
                          );
                        },
                        child: ProfileScreenTile(
                            imageUrl: "assets/log-out.png",
                            title: "Log Out",
                            content: "Logs out off this account"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => ProfileAlertBox(
                                content:
                                    "Are you sure you want to delete your account ?",
                                actionButtonText: "Delete"),
                          );
                        },
                        child: ProfileScreenTile(
                            imageUrl: "assets/delete.png",
                            title: "Delete",
                            content: "Deletes your account"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ProfileScreenTile(
                          imageUrl: "assets/terms-and-conditions.png",
                          title: "Terms and Conditions",
                          content: "App policy and details"),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Foodio- Savor the Speed, Taste the Difference",
                          style: FontStyles.lightTextStyle(),
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }
}

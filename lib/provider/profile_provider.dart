import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:foodio/services/shared_pref.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileProvider with ChangeNotifier {
  String? profile, name, email;
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  ProfileProvider() {
    onTheLoad();
  }

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectedImage = File(image!.path);
    uploadDetails();
    notifyListeners();
  }

  uploadDetails() async {
    if (selectedImage != null) {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("blogImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();

      await SharedPrefHelper().saveUserProfile(downloadUrl);
      profile = downloadUrl;
      notifyListeners();
    }
  }

  getSharedPref() async {
    profile = await SharedPrefHelper().getUserProfile();
    name = await SharedPrefHelper().getUserName();
    email = await SharedPrefHelper().getUserEmail();
    notifyListeners();
  }

  onTheLoad() async {
    await getSharedPref();
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

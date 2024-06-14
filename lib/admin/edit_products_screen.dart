import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodio/pages/details.dart';
import 'package:foodio/services/database.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/category_selector.dart';
import 'package:image_picker/image_picker.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
 
  Stream? fooditemsStream;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  ontheLoad() async {
    fooditemsStream = await DatabaseMethods().getFoodItem("Pizza");
    setState(() {});
  }

  @override
  void initState() {
    ontheLoad();
    super.initState();
  }

  void _showEditDialog(DocumentSnapshot ds) {
    TextEditingController categoryController = TextEditingController();
    TextEditingController nameController = TextEditingController(text: ds["Name"]);
    TextEditingController descriptionController = TextEditingController(text: ds["Description"]);
    TextEditingController priceController = TextEditingController(text: ds["Price"]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Product'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: categoryController,
                  decoration: InputDecoration(labelText: 'Category'),
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      _imageFile = pickedFile;
                    });
                  },
                  child: _imageFile != null
                      ? Image.file(
                          File(_imageFile!.path),
                          height: 100,
                          width: 100,
                        )
                      : Image.network(
                          ds["Image"],
                          height: 100,
                          width: 100,
                        ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                String imageUrl = ds["Image"];
                if (_imageFile != null) {
                  // Upload new image and get URL (assuming you have a method to upload image)
                  imageUrl = await DatabaseMethods().uploadImage(File(_imageFile!.path));
                }
                // Update the product details in Firestore
                await FirebaseFirestore.instance
                    .collection(categoryController.text)
                    .doc(ds.id)
                    .update({
                  "Name": nameController.text,
                  "Description": descriptionController.text,
                  "Price": priceController.text,
                  "Image": imageUrl,
                });
                Navigator.of(context).pop();
                setState(() {});
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget allItmesVerticaly() {
    return StreamBuilder(
        stream: fooditemsStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              name: ds["Name"],
                              description: ds["Description"],
                              image: ds["Image"],
                              price: ds["Price"],
                            ),
                          )),
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0, bottom: 20.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width / 2,
                                        child: Text(
                                          ds["Name"],
                                          style: FontStyles.SemiBoldTextStyle(),
                                        )),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width / 2,
                                        child: Text(
                                          ds["Description"],
                                          style: FontStyles.lightTextStyle(),
                                        )),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width / 2,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$" + ds["Price"],
                                              style: FontStyles.SemiBoldTextStyle(),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  _showEditDialog(ds);
                                                },
                                                icon: Icon(
                                                  Icons.edit_rounded,
                                                  color: appcolor.WalletScreenColor1,
                                                ))
                                          ],
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: appcolor.LoginGradientColor2,
                );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor.backgroundColor,
        toolbarHeight: 30,
      ),
      backgroundColor: appcolor.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The Current Menu",
                style: FontStyles.headlineTextStyle(),
              ),
              SizedBox(
                height: 30,
              ),
              _buildCategoryButtons(),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              allItmesVerticaly(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
            onTap: () async {
              fooditemsStream = await DatabaseMethods().getFoodItem("Ice-cream");
              setState(() {});
            },
            child: CategorySelector(imageUrl: "assets/icecream2.png")),
        GestureDetector(
            onTap: () async {
              fooditemsStream = await DatabaseMethods().getFoodItem("Pizza");
              setState(() {});
            },
            child: CategorySelector(imageUrl: "assets/pizza2.png")),
        GestureDetector(
            onTap: () async {
              fooditemsStream = await DatabaseMethods().getFoodItem("Burger");
              setState(() {});
            },
            child: CategorySelector(imageUrl: "assets/burger2.png")),
        GestureDetector(
            onTap: () async {
              fooditemsStream = await DatabaseMethods().getFoodItem("Salad");
              setState(() {});
            },
            child: CategorySelector(imageUrl: "assets/vegan.png")),
      ],
    );
  }
}

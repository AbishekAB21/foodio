import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:foodio/admin/provider/product_provider.dart';
import 'package:foodio/pages/details.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/category_selector.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).loadFoodItems("Pizza");
    });
  }

  void _showEditDialog(DocumentSnapshot ds) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
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
                    await provider.pickImage();
                  },
                  child: provider.imageFile != null
                      ? Image.file(
                          File(provider.imageFile!.path),
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
                await provider.updateProduct(ds, categoryController.text, nameController, descriptionController, priceController, imageUrl);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget allItemsVertically() {
    final provider = Provider.of<ProductProvider>(context);
    return StreamBuilder(
      stream: provider.foodItemsStream,
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
                      ),
                    ),
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
                              SizedBox(width: 20.0),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      ds["Name"],
                                      style: FontStyles.SemiBoldTextStyle(),
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      ds["Description"],
                                      style: FontStyles.lightTextStyle(),
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
      },
    );
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
              SizedBox(height: 30),
              _buildCategoryButtons(),
              SizedBox(height: 20.0),
              SizedBox(height: 10.0),
              allItemsVertically(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () async {
            await provider.loadFoodItems("Ice-cream");
          },
          child: CategorySelector(imageUrl: "assets/icecream2.png"),
        ),
        GestureDetector(
          onTap: () async {
            await provider.loadFoodItems("Pizza");
          },
          child: CategorySelector(imageUrl: "assets/pizza2.png"),
        ),
        GestureDetector(
          onTap: () async {
            await provider.loadFoodItems("Burger");
          },
          child: CategorySelector(imageUrl: "assets/burger2.png"),
        ),
        GestureDetector(
          onTap: () async {
            await provider.loadFoodItems("Salad");
          },
          child: CategorySelector(imageUrl: "assets/vegan.png"),
        ),
      ],
    );
  }
}

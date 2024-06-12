import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodio/admin/widgets/products_text_fields.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:image_picker/image_picker.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final List<String> categories = ['Ice-cream', 'Burger', 'Salad', 'Pizza'];
  String? value;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectedImage = File(image!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: appcolor.AdminLoginGradientColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Food Item",
          style: FontStyles.headlineTextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload the picture",
                style: FontStyles.SemiBoldTextStyle(),
              ),
              SizedBox(
                height: 20.0,
              ),
              selectedImage == null
                  ? Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: appcolor.secondaryColor, width: 1.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: appcolor.AdminLoginGradientColor,
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: appcolor.secondaryColor, width: 1.5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Item name",
                style: FontStyles.SemiBoldTextStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              ProductTextFields(
                controller: nameController,
                hintText: "Enter Item Name",
                maxlines: 1,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Item price",
                style: FontStyles.SemiBoldTextStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              ProductTextFields(
                controller: priceController,
                hintText: "Enter Item Price",
                maxlines: 1,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Item Description",
                style: FontStyles.SemiBoldTextStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              ProductTextFields(
                controller: descriptionController,
                hintText: "Enter Item Description",
                maxlines: 6,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Category",
                style: FontStyles.SemiBoldTextStyle(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    color: appcolor.teritiaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: categories
                        .map((category) => DropdownMenuItem<String>(
                              child: Text(
                                category,
                                style: FontStyles.SemiBoldTextStyle(),
                              ),
                              value: category,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        this.value = value;
                      });
                    },
                    dropdownColor: appcolor.primaryColor,
                    hint: Text(
                      "Select Category",
                      style: FontStyles.lightTextStyle(),
                    ),
                    iconSize: 36,
                    icon: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: appcolor.secondaryColor,
                    ),
                    value: value,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: appcolor.secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Add Product",
                  style: FontStyles.WhiteTextStyle(),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

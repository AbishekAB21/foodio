import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
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
      body: Container(
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
            Center(
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
            ),
            SizedBox(height: 30.0,),
            Text("Item name", style: FontStyles.SemiBoldTextStyle(),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: appcolor.teritiaryColor
              ),
            )
          ],
        ),
      ),
    );
  }
}

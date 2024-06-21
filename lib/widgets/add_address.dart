import 'package:flutter/material.dart';
import 'package:foodio/provider/address_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';
import 'package:foodio/widgets/reusable_textfield.dart';
import 'package:provider/provider.dart';

class AddAddressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);

    return AlertDialog(
      icon: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.close),
      ),
      iconPadding: EdgeInsets.only(left: 280, top: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Column(
        children: [
          Text(
            "Add a new address",
            style: FontStyles.SemiBoldTextStyle(),
          ),
          SizedBox(height: 20),
          ReusableTextFormFields(
            hintText: "Name",
            prefixIcon: Icon(Icons.person),
            isNotVisible: false,
            controller: addressProvider.nameController,
          ),
          SizedBox(height: 10),
          ReusableTextFormFields(
            hintText: "House Name/Number",
            prefixIcon: Icon(Icons.home_rounded),
            isNotVisible: false,
            controller: addressProvider.houseController,
          ),
          SizedBox(height: 10),
          ReusableTextFormFields(
            hintText: "City",
            prefixIcon: Icon(Icons.location_city_rounded),
            isNotVisible: false,
            controller: addressProvider.cityController,
          ),
          SizedBox(height: 10),
          ReusableTextFormFields(
            hintText: "PIN",
            prefixIcon: Icon(Icons.pin_rounded),
            isNotVisible: false,
            controller: addressProvider.pinController,
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
              Map<String, dynamic> addressMap = {
                "Name": addressProvider.nameController.text,
                "House": addressProvider.houseController.text,
                "City": addressProvider.cityController.text,
                "Pin": addressProvider.pinController.text,
                "isDefault": false
              };

              await addressProvider.addAddress(addressMap);
              Navigator.pop(context);
              ReusableSnackBar().showSnackbar(
                context,
                "Address has been added",
                appcolor.SnackBarSuccessColor,
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: appcolor.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Add Address",
                  style: FontStyles.WhiteTextStyle(),
                ),
              ),
            ),
          )
        ],
      ),
      scrollable: true,
    );
  }
}
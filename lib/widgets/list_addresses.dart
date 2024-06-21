
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodio/provider/address_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';
import 'package:provider/provider.dart';

class AddressList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);

    return StreamBuilder(
      stream: addressProvider.addressStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: appcolor.LoginGradientColor2,
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
            bool isDefault = data.containsKey('isDefault') ? data['isDefault'] : false;

            return GestureDetector(
              onTap: () async {
                await addressProvider.setDefaultAddress(ds.id);
                ReusableSnackBar().showSnackbar(
                  context,
                  "Default address has been updated",
                  appcolor.SnackBarSuccessColor,
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isDefault ? appcolor.InterfaceIconColor : appcolor.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ds["Name"],
                              style: FontStyles.headlineTextStyle(),
                            ),
                            IconButton(
                              onPressed: () async {
                                await addressProvider.deleteAddress(ds.id);
                              },
                              icon: Image.asset(
                                "assets/delete.png",
                                height: 20,
                                width: 20,
                                color: isDefault ? appcolor.primaryColor : appcolor.SnackBarErrorColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          ds["House"],
                          style: FontStyles.MediumTextFont(),
                        ),
                        Text(
                          ds["City"],
                          style: FontStyles.MediumTextFont(),
                        ),
                        Text(
                          ds["Pin"],
                          style: FontStyles.MediumTextFont(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:foodio/widgets/add_address.dart';
import 'package:foodio/widgets/list_addresses.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/address_button.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Address",
          style: FontStyles.SemiBoldTextStyle(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AddAddressDialog(),
                );
              },
              child: AddAddressButton(),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(child: AddressList()),
          ],
        ),
      ),
    );
  }
}

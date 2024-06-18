import 'package:flutter/material.dart';
import 'package:foodio/utils/font_styles.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
    );
  }
}

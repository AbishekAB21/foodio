import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodio/utils/font_styles.dart';

class CheckoutItemsBuilder extends StatelessWidget {
  final DocumentSnapshot ds;

  const CheckoutItemsBuilder({
    Key? key,
    required this.ds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int quantity = int.parse(ds["Quantity"]);

    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 118,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(quantity.toString()),
                  ],
                ),
              ),
              SizedBox(width: 20.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network(
                  ds["Image"],
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ds["Name"],
                      overflow: TextOverflow.ellipsis,
                      style: FontStyles.SemiBoldTextStyle(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$" + ds["Total"].toString(),
                          style: FontStyles.SemiBoldTextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

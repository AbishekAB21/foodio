import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodio/pages/order_details.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    var items = order['items'] as List<dynamic>;
    String orderStatus = order['status'];

    Color statusColor;
    switch (orderStatus) {
      case "Ordered":
        statusColor = appcolor.StatusColor1;
        break;
      case "Delivered":
        statusColor = appcolor.SnackBarSuccessColor;
        break;
      case "Canceled":
        statusColor = appcolor.SnackBarErrorColor;
        break;
      default:
        statusColor = appcolor.secondaryColor;
        break;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailScreen(orderDetails: order),
          ),
        );
      },
      child: Card(
        elevation: 2,
        color: appcolor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "${item['Quantity']} x ${item['Name']}",
                    style: FontStyles.SemiBoldTextStyle(),
                  ),
                );
              }).toList(),
              SizedBox(height: 10),
              Text(
                "Ordered on: ${DateFormat('yyyy-MM-dd').format((order['orderDate'] as Timestamp).toDate())}",
                style: FontStyles.SmallTextFont(),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: \$${order['total']}",
                    style: FontStyles.MediumTextFontWithColor(),
                  ),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: statusColor,
                      ),
                      child: Text(
                        orderStatus,
                        style: FontStyles.ReallySmallTextFontWhite(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

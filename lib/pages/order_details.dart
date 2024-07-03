import 'package:flutter/material.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:intl/intl.dart';

class OrderDetailScreen extends StatelessWidget {
  final Map<String, dynamic> orderDetails;

  const OrderDetailScreen({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = orderDetails['items'] as List<dynamic>;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Order Details", style: FontStyles.boldTextStyle(),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order ID: ${orderDetails["orderId"]}",
                style: FontStyles.LargeTextFontWithColor(),
              ),
              SizedBox(height: 30),
              Text(
                "Ordered on: ${DateFormat('yyyy-MM-dd').format(orderDetails['orderDate'].toDate())}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Total: \$${orderDetails['total']}",
                style: FontStyles.MediumTextFontWithColor(),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var item = items[index];
                  return ListTile(
                    title: Text(
                      "${item['Name']}",
                      style: FontStyles.SemiBoldTextStyle(),
                    ),
                    subtitle: Text(
                      "Quantity: ${item['Quantity']}",
                      style: FontStyles.SmallTextFont(),
                    ),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        item['Image'],
                      ),
                    ),
                    //trailing: Text("\$${item['total']}"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

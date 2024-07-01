import 'package:flutter/material.dart';
import 'package:foodio/provider/order_history_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderHistoryProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Order History",
            style: FontStyles.SemiBoldTextStyle(),
          ),
        ),
        body: Consumer<OrderHistoryProvider>(
          builder: (context, orderHistoryProvider, child) {
            if (orderHistoryProvider.orders.isEmpty) {
              return Center(
                child: Lottie.asset("animations/Loading.json",
                    height: 100, width: 100),
              );
            }

            return ListView.builder(
              itemCount: orderHistoryProvider.orders.length,
              itemBuilder: (context, index) {
                var order = orderHistoryProvider.orders[index];
                var items = order['items'] as List<dynamic>;

                return Card(
                  elevation: 2,
                  color: appcolor.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
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
                          "Ordered on: ${DateFormat('yyyy-MM-dd').format(order['orderDate'].toDate())}",
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
                            // Container(
                            //   padding: EdgeInsets.all(5),
                            //   decoration: BoxDecoration(
                            //       color: appcolor.WariningColor,
                            //       borderRadius: BorderRadius.circular(5)),
                            //   child: Text(
                            //     "Ordered",
                            //     style: FontStyles.ReallySmallTextFontWhite(),
                            //   ),
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

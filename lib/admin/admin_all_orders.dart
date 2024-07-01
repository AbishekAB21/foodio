import 'package:flutter/material.dart';
import 'package:foodio/admin/provider/all_orders_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllOrdersProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "All Orders",
            style: FontStyles.SemiBoldTextStyle(),
          ),
        ),
        body: Consumer<AllOrdersProvider>(
          builder: (context, allOrdersProvider, child) {
            if (allOrdersProvider.orders.isEmpty) {
              return Center(
                child: Lottie.asset("animations/Loading.json",
                    height: 100, width: 100),
              );
            }

            return ListView.builder(
              itemCount: allOrdersProvider.orders.length,
              itemBuilder: (context, index) {
                /* 
                "order" extracts a single order from the orders[] list coming 
                from the AllOrdersProvider.

                "Items" coverts this single data to list<dynamic> and makes it 
                possible for the UI to display it
                */
                var order = allOrdersProvider.orders[index];
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
                        /* 
                      Iterating over the list and for each "item" in "items" list
                      a widget is created and displayed with the data provided.
                      */
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
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: appcolor.WariningColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "Ordered",
                                style: FontStyles.ReallySmallTextFontWhite(),
                              ),
                            )
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

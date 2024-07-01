import 'package:flutter/material.dart';
import 'package:foodio/admin/provider/all_orders_provider.dart';
import 'package:foodio/admin/widgets/finance_sort_buttons.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          allOrdersProvider.applyFilter(
                            "All Time",
                          );

                          ReusableSnackBar().showSnackbar(context,
                              "Sorted by All Time", appcolor.secondaryColor);
                        },
                        child: SortButton(
                          title: "All Time",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          allOrdersProvider.applyFilter("This Year");

                          ReusableSnackBar().showSnackbar(context,
                              "Sorted by This Year", appcolor.secondaryColor);
                        },
                        child: SortButton(
                          title: "This Year",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          allOrdersProvider.applyFilter("This Month");

                          ReusableSnackBar().showSnackbar(context,
                              "Sorted by This Month", appcolor.secondaryColor);
                        },
                        child: SortButton(
                          title: "This Month",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          allOrdersProvider.applyFilter("Today");

                          ReusableSnackBar().showSnackbar(context,
                              "Sorted by Today", appcolor.secondaryColor);
                        },
                        child: SortButton(
                          title: "Today",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: allOrdersProvider.filteredOrders.length,
                      itemBuilder: (context, index) {
                        var order = allOrdersProvider.filteredOrders[index];
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                                Text(
                                  "Ordered By: ${order["userName"]}, ${order["userCity"]}",
                                  style: FontStyles.SmallTextFont(),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total: \$${order['total']}",
                                      style:
                                          FontStyles.MediumTextFontWithColor(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

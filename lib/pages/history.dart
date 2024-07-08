import 'package:flutter/material.dart';
import 'package:foodio/admin/widgets/finance_sort_buttons.dart';
import 'package:foodio/controllers/network_controller.dart';
import 'package:foodio/pages/order_details.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodio/provider/order_history_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class OrderHistory extends StatelessWidget {
  OrderHistory({super.key});

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
            NetworkController networkController = Get.find();

            return Obx(() {
              if (networkController.connectionStatus.value == "Offline") {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/No-Internet.jpeg",
                        height: 300,
                        width: 300,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Check your Internet Connection.",
                        style: FontStyles.lightTextStyle(),
                      ),
                    ],
                  ),
                );
              }

              if (orderHistoryProvider.filteredOrders.isEmpty) {
                return Center(
                  child: Lottie.asset("animations/Loading.json",
                      height: 100, width: 100),
                );
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            orderHistoryProvider.applyFilter("All Time");
                          },
                          child: SortButton(title: "All Time"),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            orderHistoryProvider.applyFilter("This Year");
                          },
                          child: SortButton(title: "This Year"),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            orderHistoryProvider.applyFilter("This Month");
                          },
                          child: SortButton(title: "This Month"),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            orderHistoryProvider.applyFilter("Today");
                          },
                          child: SortButton(title: "Today"),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: orderHistoryProvider.filteredOrders.length,
                        itemBuilder: (context, index) {
                          var order = orderHistoryProvider.filteredOrders[index];
                          var items = order['items'] as List<dynamic>;

                          String ordersts = order['status'];

                          Color statusColor;
                          switch (ordersts) {
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
                                  builder: (context) =>
                                      OrderDetailScreen(orderDetails: order),
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total: \$${order['total']}",
                                          style: FontStyles
                                              .MediumTextFontWithColor(),
                                        ),
                                        Material(
                                          elevation: 2,
                                          borderRadius: BorderRadius.circular(7),
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: statusColor,
                                            ),
                                            child: Text(
                                              ordersts,
                                              style: FontStyles
                                                  .ReallySmallTextFontWhite(),
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
                        },
                      ),
                    ),
                  ],
                ),
              );
            });
          },
        ),
      ),
    );
  }
}

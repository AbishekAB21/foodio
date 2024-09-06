import 'package:flutter/material.dart';
import 'package:foodio/components/no_internet.dart';
import 'package:foodio/controllers/network_controller.dart';
import 'package:foodio/functions/sort_button.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:foodio/provider/order_history_provider.dart';
import 'package:foodio/widgets/order_card.dart';

class OrderHistory extends StatelessWidget {
  OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderHistoryProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          forceMaterialTransparency: true,
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
                  child: NoInternet(),
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
                        SortingButton(
                          title: "All Time",
                          onTap: () {
                            orderHistoryProvider.applyFilter("All Time");
                          },
                        ),
                        SizedBox(height: 10),
                        SortingButton(
                          title: "This Year",
                          onTap: () {
                            orderHistoryProvider.applyFilter("This Year");
                          },
                        ),
                        SizedBox(height: 10),
                        SortingButton(
                          title: "This Month",
                          onTap: () {
                            orderHistoryProvider.applyFilter("This Month");
                          },
                        ),
                        SizedBox(height: 10),
                        SortingButton(
                          title: "Today",
                          onTap: () {
                            orderHistoryProvider.applyFilter("Today");
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: orderHistoryProvider.filteredOrders.length,
                        itemBuilder: (context, index) {
                          var order = orderHistoryProvider.filteredOrders[index];
                          return OrderCard(order: order); // Use OrderCard here
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

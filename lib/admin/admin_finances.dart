import 'package:flutter/material.dart';
import 'package:foodio/admin/provider/finance_provider.dart';
import 'package:provider/provider.dart';
import 'package:foodio/admin/admin_all_orders.dart';
import 'package:foodio/admin/widgets/finance_sort_buttons.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class FinancesScreen extends StatelessWidget {
  const FinancesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FinancesProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Finances",
            style: FontStyles.boldTextStyle(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Consumer<FinancesProvider>(
            builder: (context, financesProvider, child) {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => financesProvider.onSortButtonPressed("All Time"),
                        child: SortButton(
                          title: "All Time",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () => financesProvider.onSortButtonPressed("This Month"),
                        child: SortButton(
                          title: "This Month",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () => financesProvider.onSortButtonPressed("This Year"),
                        child: SortButton(
                          title: "This Year",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () => financesProvider.onSortButtonPressed("Today"),
                        child: SortButton(
                          title: "Today",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: appcolor.financeColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(
                            "Money Earned: ",
                            style: FontStyles.WhiteTextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              "\$${financesProvider.totalEarnings.toStringAsFixed(2)}",
                              style: FontStyles.WhiteTextStyle3(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "For more details, ",
                          style: FontStyles.MediumTextFont(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllOrders(),
                              ),
                            );
                          },
                          child: Text(
                            "click here",
                            style: FontStyles.MediumTextFontWithColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

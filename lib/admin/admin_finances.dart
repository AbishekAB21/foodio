import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodio/admin/admin_all_orders.dart';
import 'package:foodio/admin/widgets/finance_sort_buttons.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class FinancesScreen extends StatefulWidget {
  const FinancesScreen({super.key});

  @override
  _FinancesScreenState createState() => _FinancesScreenState();
}

class _FinancesScreenState extends State<FinancesScreen> {
  double totalEarnings = 0.0;
  String selectedTimeFrame = "All Time";

  @override
  void initState() {
    super.initState();
    fetchTotalEarnings("All Time");
  }

  Future<void> fetchTotalEarnings(String timeFrame) async {
    double total = 0.0;
    DateTime now = DateTime.now();
    QuerySnapshot querySnapshot;

    switch (timeFrame) {
      case "Today":
        DateTime startOfDay = DateTime(now.year, now.month, now.day);
        querySnapshot = await FirebaseFirestore.instance
            .collection("AllOrders")
            .where("orderDate", isGreaterThanOrEqualTo: startOfDay)
            .get();
        break;
      case "This Month":
        DateTime startOfMonth = DateTime(now.year, now.month, 1);
        querySnapshot = await FirebaseFirestore.instance
            .collection("AllOrders")
            .where("orderDate", isGreaterThanOrEqualTo: startOfMonth)
            .get();
        break;
      case "This Year":
        DateTime startOfYear = DateTime(now.year, 1, 1);
        querySnapshot = await FirebaseFirestore.instance
            .collection("AllOrders")
            .where("orderDate", isGreaterThanOrEqualTo: startOfYear)
            .get();
        break;
      case "All Time":
      default:
        querySnapshot =
            await FirebaseFirestore.instance.collection("AllOrders").get();
        break;
    }

    for (var doc in querySnapshot.docs) {
      total += double.parse(doc["total"].toString());
    }

    setState(() {
      totalEarnings = total;
      selectedTimeFrame = timeFrame;
    });
  }

  void onSortButtonPressed(String timeFrame) {
    fetchTotalEarnings(timeFrame);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => onSortButtonPressed("All Time"),
                  child: SortButton(
                    title: "All Time",
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => onSortButtonPressed("This Month"),
                  child: SortButton(
                    title: "This Month",
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => onSortButtonPressed("This Year"),
                  child: SortButton(
                    title: "This Year",
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => onSortButtonPressed("Today"),
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
                      "\$${totalEarnings.toStringAsFixed(2)}",
                      style: FontStyles.WhiteTextStyle3(),
                    )),
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
                            ));
                      },
                      child: Text("click here",
                          style: FontStyles.MediumTextFontWithColor()))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

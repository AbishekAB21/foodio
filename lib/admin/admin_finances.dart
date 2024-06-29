import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodio/admin/admin_all_orders.dart';
import 'package:foodio/admin/widgets/finance_sort_buttons.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class FinancesScreen extends StatelessWidget {
  const FinancesScreen({super.key});

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
                SortButton(title: "All Time"),
                SizedBox(
                  width: 10,
                ),
                SortButton(title: "This Month"),
                SizedBox(
                  width: 10,
                ),
                SortButton(title: "This Year"),
                SizedBox(
                  width: 10,
                ),
                SortButton(title: "Today"),
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
                      "\$200.00",
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
                              builder: (context) => Allorders(),
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

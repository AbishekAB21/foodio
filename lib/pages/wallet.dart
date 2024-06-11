import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 2.0,
                shadowColor: appcolor.secondaryColor,
                child: Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                      "Wallet",
                      style: FontStyles.headlineTextStyle(),
                    ))),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: appcolor.backgroundColor),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/wallet.png",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wallet balance",
                          style: FontStyles.lightTextStyle(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "\$" + "100",
                          style: FontStyles.boldTextStyle(),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Add Money",
                  style: FontStyles.SemiBoldTextStyle(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: appcolor.borderColor1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "\$" + "100",
                        style: FontStyles.SemiBoldTextStyle(),
                      )),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: appcolor.borderColor1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "\$" + "500",
                        style: FontStyles.SemiBoldTextStyle(),
                      )),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: appcolor.borderColor1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "\$" + "800",
                        style: FontStyles.SemiBoldTextStyle(),
                      )),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: appcolor.borderColor1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "\$" + "1000",
                        style: FontStyles.SemiBoldTextStyle(),
                      )),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                padding: EdgeInsets.symmetric(vertical: 12.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.8),
                  color: appcolor.WalletScreenColor1
                ),
                child: Center(child: Text("Add Money", style: FontStyles.WhiteTextStyle(),),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

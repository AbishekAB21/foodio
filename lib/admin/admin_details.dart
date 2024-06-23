import 'package:flutter/material.dart';
import 'package:foodio/services/shared_pref.dart';
import 'package:foodio/utils/font_styles.dart';


// ignore: must_be_immutable
class AdminDetailsScreen extends StatefulWidget {
  String image, name, description, price;
  AdminDetailsScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.description,
      required this.price});

  @override
  State<AdminDetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<AdminDetailsScreen> {
  int count = 1, total = 0;
  String? id;
  bool filled = false;

  getSharedpref() async {
    id = await SharedPrefHelper().getUserId();
    print("User ID fetched: $id"); // Debug print
    if (id != null) {
      setState(() {});
    }
  }

  ontheLoad() async {
    await getSharedpref();
    setState(() {});
  }

  @override
  void initState() {
    total = int.parse(widget.price);
    super.initState();
    ontheLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        title: Text(
          widget.name,
          style: FontStyles.SemiBoldTextStyle(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              
              children: [
                Text(
                  widget.name,
                  style: FontStyles.SemiBoldTextStyle(),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              widget.description,
              maxLines: 3,
              style: FontStyles.lightTextStyle(),
            ),
            SizedBox(
              height: 30.0,
            ),
           
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: FontStyles.SemiBoldTextStyle(),
                      ),
                      Text(
                        "\$" + total.toString(),
                        style: FontStyles.headlineTextStyle(),
                      )
                    ],
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodio/pages/details.dart';
import 'package:foodio/services/database.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/category_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
 
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? fooditemsStream;

  ontheLoad() async {
    fooditemsStream = await DatabaseMethods().getFoodItem("Pizza");
    setState(() {});
  }

  @override
  void initState() {
    ontheLoad();
    super.initState();
  }

  Widget allItmes() {
    return StreamBuilder(
        stream: fooditemsStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              name: ds["Name"],
                              description: ds["Description"],
                              image: ds["Image"],
                              price: ds["Price"],
                            ),
                          )),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  ds["Name"],
                                  style: FontStyles.SemiBoldTextStyle(),
                                ),
                                SizedBox(
                                  height: 4.8,
                                ),
                                Text(
                                  ds["Description"],
                                  style: FontStyles.lightTextStyle(),
                                ),
                                SizedBox(
                                  height: 4.8,
                                ),
                                Text(
                                  "\$" + ds["Price"],
                                  style: FontStyles.SemiBoldTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: appcolor.LoginGradientColor2,
                );
        });
  }

  Widget allItmesVerticaly() {
    return StreamBuilder(
        stream: fooditemsStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              name: ds["Name"],
                              description: ds["Description"],
                              image: ds["Image"],
                              price: ds["Price"],
                            ), 
                          )),
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0, bottom: 20.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                          ds["Name"],
                                          style: FontStyles.SemiBoldTextStyle(),
                                        )),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                          ds["Description"],
                                          style: FontStyles.lightTextStyle(),
                                        )),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                          "\$" + ds["Price"],
                                          style: FontStyles.SemiBoldTextStyle(),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: appcolor.LoginGradientColor2,
                );
        }); 
  }
 
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello User,",
                    style: FontStyles.boldTextStyle(),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: appcolor.secondaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: appcolor.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "The Delicacies We Offer",
                style: FontStyles.headlineTextStyle(),
              ),
              Text(
                "Supress your cravings",
                style: FontStyles.lightTextStyle(),
              ),
              SizedBox(
                height: 30,
              ),
              _buildCategoryButtons(),
              SizedBox(
                height: 20.0,
              ),
              Container(height: 270, child: allItmes()),
              SizedBox(
                height: 10.0,
              ),
              allItmesVerticaly(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
            onTap: () async {
              fooditemsStream =
                  await DatabaseMethods().getFoodItem("Ice-cream");
            },
            child: CategorySelector(imageUrl: "assets/icecream2.png")),
        GestureDetector(
            onTap: () async {
              fooditemsStream = await DatabaseMethods().getFoodItem("Pizza");
            },
            child: CategorySelector(imageUrl: "assets/pizza2.png")),
        GestureDetector(
            onTap: () async {
              fooditemsStream = await DatabaseMethods().getFoodItem("Burger");
            },
            child: CategorySelector(imageUrl: "assets/burger2.png")),
        GestureDetector(
            onTap: () async {
              fooditemsStream = await DatabaseMethods().getFoodItem("Salad");
            },
            child: CategorySelector(imageUrl: "assets/vegan.png")),
      ],
    );
  }
}

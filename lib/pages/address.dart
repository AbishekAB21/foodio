import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodio/services/database.dart';
import 'package:foodio/services/shared_pref.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/address_button.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';
import 'package:foodio/widgets/reusable_textfield.dart';

class AddressScreen extends StatefulWidget {
  AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController NameController = TextEditingController();
  final TextEditingController HouseController = TextEditingController();
  final TextEditingController CityController = TextEditingController();
  final TextEditingController PinController = TextEditingController();
  String? id;

  getThesharedpref() async {
    id = await SharedPrefHelper().getUserId();
    setState(() {});
  }

  ontheLoad() async {
    await getThesharedpref();
    addressStream = await DatabaseMethods().getAddresses(id!);
    setState(() {});
  }

  @override
  void initState() {
    ontheLoad();
    super.initState();
  }

  Stream? addressStream;

  Widget addresses() {
    return StreamBuilder(
        stream: addressStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ds["Name"],
                                    style: FontStyles.headlineTextStyle(),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        await DatabaseMethods()
                                            .deleteAddress(id!, ds.id);
                                      },
                                      icon: Image.asset(
                                        "assets/delete.png",
                                        height: 20,
                                        width: 20,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                ds["House"],
                                style: FontStyles.MediumTextFont(),
                              ),
                              Text(
                                ds["City"],
                                style: FontStyles.MediumTextFont(),
                              ),
                              Text(
                                ds["Pin"],
                                style: FontStyles.MediumTextFont(),
                              ),
                            ],
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Address",
          style: FontStyles.SemiBoldTextStyle(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      icon: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close)),
                      iconPadding: EdgeInsets.only(left: 280, top: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      content: Column(
                        children: [
                          Text(
                            "Add a new address",
                            style: FontStyles.SemiBoldTextStyle(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ReusableTextFormFields(
                              hintText: "Name",
                              prefixIcon: Icon(Icons.person),
                              isNotVisible: false,
                              controller: NameController),
                          SizedBox(
                            height: 10,
                          ),
                          ReusableTextFormFields(
                              hintText: "House Name/Number",
                              prefixIcon: Icon(Icons.home_rounded),
                              isNotVisible: false,
                              controller: HouseController),
                          SizedBox(
                            height: 10,
                          ),
                          ReusableTextFormFields(
                              hintText: "City",
                              prefixIcon: Icon(Icons.location_city_rounded),
                              isNotVisible: false,
                              controller: CityController),
                          SizedBox(
                            height: 10,
                          ),
                          ReusableTextFormFields(
                              hintText: "PIN",
                              prefixIcon: Icon(Icons.pin_rounded),
                              isNotVisible: false,
                              controller: PinController),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              // Adding Address to firebase

                              Map<String, dynamic> addressMap = {
                                "Name": NameController.text,
                                "House": HouseController.text,
                                "City": CityController.text,
                                "Pin": PinController.text
                              };

                              try {
                                await DatabaseMethods()
                                    .addAddress(addressMap, id!);
                                ReusableSnackBar().showSnackbar(
                                    context,
                                    "${count} Address has been added",
                                    appcolor.SnackBarSuccessColor);
                                Navigator.pop(context);
                              } catch (e) {
                                ReusableSnackBar().showSnackbar(
                                    context,
                                    "Error adding new Address: $e",
                                    appcolor.SnackBarErrorColor);
                                print("Error adding Address: $e");
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: appcolor.secondaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "Add Address",
                                style: FontStyles.WhiteTextStyle(),
                              )),
                            ),
                          )
                        ],
                      ),
                      scrollable: true,
                    ),
                  );
                },
                child: AddAddressButton()),
            SizedBox(
              height: 30,
            ),
            addresses(),
          ],
        ),
      ),
    );
  }
}

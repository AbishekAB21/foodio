import 'package:flutter/material.dart';
import 'package:foodio/utils/font_styles.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy Policy",
          style: FontStyles.boldTextStyle(),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/terms-and-conditions.png",
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Privacy Policy",
                    style: FontStyles.MediumTextFont(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "These terms and conditions are effective as of 04-07-2024",
                style: FontStyles.SmallTextFont(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "This privacy policy applies to the Foodio app (hereby referred to as 'Application') for mobile devices that was created by Abishek AB (hereby referred to as 'Service Provider') as a Free service. This service is intended for use 'AS IS'.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Information Collection and Use",
                    style: FontStyles.SomethingInBetween(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "The Application collects information when you download and use it. This information may include information such as:",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text(
                    "○",
                    style: FontStyles.MediumTextFont(),
                  ),
                  Text(
                    " Your device's Internet Protocol address (e.g. IP address)",
                    style: FontStyles.SmallTextFontLight(),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text(
                    "○",
                    style: FontStyles.MediumTextFont(),
                  ),
                  Text(
                    " The pages of the Application that you visit, the time and",
                    style: FontStyles.SmallTextFontLight(),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    "date of your visit, the time spent on those pages",
                    style: FontStyles.SmallTextFontLight(),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text(
                    "○",
                    style: FontStyles.MediumTextFont(),
                  ),
                  Text(
                    " The time spent on the Application",
                    style: FontStyles.SmallTextFontLight(),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text(
                    "○",
                    style: FontStyles.MediumTextFont(),
                  ),
                  Text(
                    " The operating system you use on your mobile device",
                    style: FontStyles.SmallTextFontLight(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "The Application does not gather precise information about the location of your mobile device.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "The Service Provider may use the information you provided to contact you from time to time to provide you with important information, required notices and marketing promotions.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "For a better experience, while using the Application, the Service Provider may require you to provide us with certain personally identifiable information, including but not limited to Email, Name, Address. The information that the Service Provider request will be retained by them and used as described in this privacy policy.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Third Party Access",
                    style: FontStyles.SomethingInBetween(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Only aggregated, anonymised data is periodically transmitted to external services to aid the Service Provider in improving the Application and their service. The Service Provider may share your information with third parties in the ways that are described in this privacy statement.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please note that the Application utilises third-party services that have their own Privacy Policy about handling data. Below are the links to the Privacy Policy of the third-party service providers used by the Application:",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "○",
                    style: FontStyles.MediumTextFont(),
                  ),
                  Text(
                    " Google Play Services",
                    style: FontStyles.SmallTextFontLight(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "○",
                    style: FontStyles.MediumTextFont(),
                  ),
                  Text(
                    " Google Analytics for Firebase",
                    style: FontStyles.SmallTextFontLight(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "The Service Provider may disclose User Provided and Automatically Collected Information:",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text(
                    "○",
                    style: FontStyles.MediumTextFont(),
                  ),
                  Text(
                    " as required by law, such as to comply with a subpoena,",
                    style: FontStyles.SmallTextFontLight(),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    " or similar legal process;",
                    style: FontStyles.SmallTextFontLight(),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

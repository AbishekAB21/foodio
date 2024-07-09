import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:foodio/widgets/reusable_snackbar.dart';

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
        forceMaterialTransparency: true,
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
              Row(
                children: [
                  Text(
                    "○",
                    style: FontStyles.MediumTextFont(),
                  ),
                  Text(
                    " when they believe in good faith that disclosure is ",
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
                    " necessary to protect their rights, protect your safety ",
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
                    " or the safety of others investigate fraud, or respond ",
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
                    " to a government request;",
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
                    " with their trusted services providers who work on their ",
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
                    " behalf, do not have an independent use of the",
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
                    " information we disclose to them, and have agreed to ",
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
                    " adhere to the rules set forth in this privacy statement.",
                    style: FontStyles.SmallTextFontLight(),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Opt-Out Rights",
                    style: FontStyles.SomethingInBetween(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "You can stop all collection of information by the Application easily by uninstalling it. You may use the standard uninstall processes as may be available as part of your mobile device or via the mobile application marketplace or network.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Data Retention Policy",
                    style: FontStyles.SomethingInBetween(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "The Service Provider will retain User Provided data for as long as you use the Application and for a reasonable time thereafter. If you'd like them to delete User Provided Data that you have provided via the Application, please contact them at abiabi1822@gmail.com and they will respond in a reasonable time.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Children",
                    style: FontStyles.SomethingInBetween(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "The Service Provider does not use the Application to knowingly solicit data from or market to children under the age of 13.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "The Application does not address anyone under the age of 13. The Service Provider does not knowingly collect personally identifiable information from children under 13 years of age. In the case the Service Provider discover that a child under 13 has provided personal information, the Service Provider will immediately delete this from their servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact the Service Provider (abiabi1822@gmail.com) so that they will be able to take the necessary actions.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Security",
                    style: FontStyles.SomethingInBetween(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "The Service Provider is concerned about safeguarding the confidentiality of your information. The Service Provider provides physical, electronic, and procedural safeguards to protect information the Service Provider processes and maintains.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Changes",
                    style: FontStyles.SomethingInBetween(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "This Privacy Policy may be updated from time to time for any reason. The Service Provider will notify you of any changes to the Privacy Policy by updating this page with the new Privacy Policy. You are advised to consult this Privacy Policy regularly for any changes, as continued use is deemed approval of all changes.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Your Consent",
                    style: FontStyles.SomethingInBetween(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "By using the Application, you are consenting to the processing of your information as set forth in this Privacy Policy now and as amended by us.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Contact Us",
                    style: FontStyles.SomethingInBetween(),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "If you have any questions regarding privacy while using the Application, or have questions about the practices, please contact the Service Provider via email at abiabi1822@gmail.com.",
                style: FontStyles.SmallTextFontLight(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  ReusableSnackBar().showSnackbar(
                      context,
                      "Accepted Privacy Policy",
                      appcolor.SnackBarSuccessColor);
                },
                child: Material(
                  elevation: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: appcolor.InterfaceIconColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Accept Privacy Policy",
                        style: FontStyles.WhiteTextStyle(),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

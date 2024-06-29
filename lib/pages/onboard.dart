import 'package:flutter/material.dart';
import 'package:foodio/model/content_model.dart';
import 'package:foodio/pages/sign_up.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';
import 'package:lottie/lottie.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                onPageChanged: (int index) {
                  currentIndex = index;
                },
                itemCount: contents.length,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          contents[i].image,
                          height: 450,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                          repeat: true,
                          reverse: false
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          contents[i].title,
                          style: FontStyles.headlineTextStyle(),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Center(
                            child: Text(
                          contents[i].description,
                          style: FontStyles.SmallTextFont(),
                        )),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length, (index) {
                return buildDotIndicator(context, index);
              }),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == contents.length - 1) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ));
              }
              _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.decelerate);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: appcolor.LoginGradientColor1,
                  borderRadius: BorderRadius.circular(10)),
              height: 60,
              margin: EdgeInsets.all(40.0),
              width: double.infinity,
              child: Center(
                child: Text(
                  currentIndex == contents.length - 1 ? "Get Started" : "Next",
                  style: FontStyles.WhiteTextStyle(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Container buildDotIndicator(BuildContext context, int index) {
    return Container(
      height: 10.0,
      width: currentIndex == index ? 30 : 10,
      margin: EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: appcolor.LoginGradientColor2),
    );
  }
}

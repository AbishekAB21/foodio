import 'package:flutter/material.dart';
import 'package:foodio/model/content_model.dart';
import 'package:foodio/utils/font_styles.dart';

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
          PageView.builder(
              controller: _controller,
              onPageChanged: (int index) {
                currentIndex = index;
              },
              itemCount: contents.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image,
                        height: 450,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        contents[i].title,
                        style: FontStyles.SemiBoldTextStyle(),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(contents[i].description),
                    ],
                  ),
                );
              }),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length, (index) {
                return buildDotIndicator(context, index);
              }),
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
    return Container();
  }
}

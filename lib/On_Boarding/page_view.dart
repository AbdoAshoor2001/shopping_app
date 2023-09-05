import 'package:flutter/material.dart';
import 'package:shopping_app/On_Boarding/model.dart';
import 'package:shopping_app/On_Boarding/view.dart';

class PageViewOnBoarding extends StatefulWidget {
  const PageViewOnBoarding({Key? key}) : super(key: key);

  @override
  State<PageViewOnBoarding> createState() => _PageViewOnBoardingState();
}

final pageController = PageController();
int? pageChanged;

class _PageViewOnBoardingState extends State<PageViewOnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            pageChanged = value;
          });
        },
        controller: pageController,
        children: onBoardingModel.map((e) => OnBoardingView(model: e)).toList(),
      ),
    );
  }
}

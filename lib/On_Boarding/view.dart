import 'package:flutter/material.dart';
import 'package:shopping_app/On_Boarding/page_view.dart';
import 'package:shopping_app/Widget/container_color_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Constants/colors.dart';
import '../Widget/container_non_color_button.dart';
import 'model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key, required this.model}) : super(key: key);
  final OnBoardingModel model;

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 20,
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: SwapEffect(
                dotWidth: 6,
                dotHeight: 6,
                dotColor: activeDotColor,
                activeDotColor: dotColor,
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            Image.asset(
              widget.model.image,
            ),
            Text(
              widget.model.salary,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.model.subtitle,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.model.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            widget.model.changeButton!
                ? ContainerColorButton(
                    onTap: () {
                      pageController.animateToPage(pageChanged! + 1,
                          duration: const Duration(microseconds: 250),
                          curve: Curves.bounceIn);
                    },
                    text: 'master Button')
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ContainerNonColorButton(onTap: () {}, text: 'Sign In'),
                      const SizedBox(
                        height: 16,
                      ),
                      ContainerColorButton(
                          onTap: () {}, text: 'Creative account')
                    ],
                  ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

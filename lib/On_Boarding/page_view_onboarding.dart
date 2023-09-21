import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/On_Boarding/onboarding_model.dart';
import 'package:shopping_app/On_Boarding/states.dart';
import 'package:shopping_app/On_Boarding/onboarding_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Core/Constants/colors.dart';
import 'onboarding_cubit.dart';

class PageViewOnBoarding extends StatelessWidget {
  const PageViewOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CubitOnboarding>(context);
    return Scaffold(
      backgroundColor: backGroundColor,
      body: BlocBuilder<CubitOnboarding, OnboardingStates>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SmoothPageIndicator(
                controller: cubit.pageController,
                count: 3,
                effect: SwapEffect(
                  dotWidth: 6,
                  dotHeight: 6,
                  dotColor: activeDotColor,
                  activeDotColor: dotColor,
                ),
              ),
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    cubit.pageChanged = value;
                  },
                  controller: cubit.pageController,
                  children: onBoardingModel
                      .map((e) => OnBoardingView(model: e))
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

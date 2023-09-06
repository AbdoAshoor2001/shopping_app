import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/On_Boarding/cubit.dart';
import 'package:shopping_app/On_Boarding/states.dart';
import 'package:shopping_app/Widget/container_color_button.dart';
import '../Widget/container_non_color_button.dart';
import 'model.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key, required this.model}) : super(key: key);
  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<CubitOnboarding, OnboardingStates>(
          builder: (context, state) {
            final cubit = BlocProvider.of<CubitOnboarding>(context);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    model.image,
                  ),
                  Text(
                    model.salary,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    model.subtitle,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    model.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  model.changeButton
                      ? ContainerColorButton(
                          onTap: () {
                            cubit.pageController.animateToPage(
                                cubit.pageChanged! + 1,
                                duration: const Duration(microseconds: 250),
                                curve: Curves.bounceIn);
                          },
                          text: 'master Button')
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ContainerNonColorButton(
                                onTap: () {}, text: 'Sign In'),
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
            );
          },
        ));
  }
}

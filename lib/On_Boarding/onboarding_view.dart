import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/On_Boarding/onboarding_cubit.dart';
import 'package:shopping_app/On_Boarding/states.dart';
import 'package:shopping_app/Register/sign_up_view.dart';
import 'package:shopping_app/Widget/container_color_button.dart';
import '../Core/Constants/colors.dart';
import '../SignIn/sign_in_view.dart';
import '../Widget/Custom_text.dart';
import '../Widget/container_non_color_button.dart';
import 'onboarding_model.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key, required this.model}) : super(key: key);
  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: BlocBuilder<CubitOnboarding, OnboardingStates>(
          builder: (context, state) {
            final cubit = BlocProvider.of<CubitOnboarding>(context);
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  model.image,
                ),
                CustomTextView(
                  color: textColor,
                  size: 20,
                  text: model.salary,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextView(text: model.subtitle, size: 17,color: textColor),
                const SizedBox(
                  height: 15,
                ),
                CustomTextView(
                  color: textColor,
                  text: model.title,
                  size: 40,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                model.changeButton
                    ? ContainerColorButton(
                  color: containerColor,
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
                            selectIcon: true,
                            textColor: textColor,
                            colorBorder: textColor,
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) =>
                                const SignInView()));
                              }, text: 'Sign In'),
                          const SizedBox(
                            height: 16,
                          ),
                          ContainerColorButton(
                            color: containerColor,
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SingUpView()));
                              },
                              text: 'Creative account')
                        ],
                      ),
                const SizedBox(height: 20,)

              ],
            );
          },
        ));
  }
}

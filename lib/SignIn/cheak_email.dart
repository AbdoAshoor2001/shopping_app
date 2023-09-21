import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import '../Core/Constants/colors.dart';
import '../Widget/Custom_text.dart';
import '../Widget/container_color_button.dart';

class CheckEmailView extends StatefulWidget {
  const CheckEmailView({Key? key}) : super(key: key);

  @override
  State<CheckEmailView> createState() => _CheckEmailViewState();
}

class _CheckEmailViewState extends State<CheckEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textColor,
      appBar: AppBar(
        backgroundColor: textColor,
        elevation: 0.0,
        actions: [
          InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 20),
                child: Icon(
                  Icons.close,
                  color: backGroundColor,
                ),
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Center(
                  child: AvatarGlow(
                      endRadius: 100,
                      glowColor: buttonContainerColor,
                      duration: Duration(milliseconds: 2500),
                      repeatPauseDuration: const Duration(microseconds: 150),
                      showTwoGlows: true,
                      repeat: true,
                      child: Image.asset(
                        'assets/images/Group 2165.png',
                        height: 50,
                        width: 50,
                      )),
                ),
                CustomTextView(
                  text: 'Check your email',
                  color: backGroundColor,
                  size: 30,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextView(
                  text:
                      'We\'ve sent you instructions on how to reset the \n ( password also check the Spam folder ).',
                  color: textGrayColor,
                  size: 14,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: ContainerColorButton(
              onTap: () {},
              color: buttonContainerColor,
              text: 'Open My Mail Client',
            ),
          ),
        ],
      ),
    );
  }
}

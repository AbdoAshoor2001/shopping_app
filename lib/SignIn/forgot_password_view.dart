import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Core/Constants/colors.dart';
import 'package:shopping_app/SignIn/cheak_email.dart';
import 'package:shopping_app/SignIn/sign_in_view.dart';
import 'package:shopping_app/SignIn/state_sign_in.dart';

import '../Widget/Custom_Container.dart';
import '../Widget/Custom_TextFromFiled.dart';
import '../Widget/Custom_text.dart';
import '../Widget/container_color_button.dart';
import 'cubit_sign_in.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubitSignIn = BlocProvider.of<SignInCubit>(context);

    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: CustomTextView(
          text: 'Reset password',
          color: textColor,
          size: 13,
          textAlign: TextAlign.center,
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignInView()));
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          BlocConsumer<SignInCubit, SignInStates>(
            listener: (context, state) {
              if (state is SucessForgotPasswordState)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const CheckEmailView()));
              }
            },
            builder: (context, state) {
              return CustomContainer(
                child: Form(
                  key: cubitSignIn.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      CustomTextView(
                        text: 'Forgot your password?',
                        color: backGroundColor,
                        size: 25,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextView(
                        text:
                            'Enter your email address and we will send you \n instructions on how to reset your password.',
                        color: textGrayColor,
                        size: 14,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTextFromFiled(
                        labelText: 'Email address',
                        controller: cubitSignIn.emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          cubitSignIn.emailController.text = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email can not be empty';
                          } else if (!value.contains('@gmail.com')) {
                            return 'email must contain @gmail.com';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 430,
                      ),
                      ContainerColorButton(
                        text: state is LoadingForgotPasswordState ? 'Reset my password': 'Recover email',
                        color: buttonContainerColor,
                        onTap: () {
                          if (cubitSignIn.formKey.currentState!.validate() &&
                              cubitSignIn
                                  .emailController.value.text.isNotEmpty) {
                            cubitSignIn.forgotPassword(
                                email: cubitSignIn.emailController.value.text);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

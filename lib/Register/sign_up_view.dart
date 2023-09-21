import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Register/cubit_signup.dart';
import 'package:shopping_app/Register/states_signup.dart';
import 'package:shopping_app/Widget/Custom_TextFromFiled.dart';
import 'package:shopping_app/Widget/Custom_text.dart';
import '../Core/Constants/colors.dart';
import '../Core/Direct_Sign__In/Sign_In_direct_cubit.dart';
import '../On_Boarding/page_view_onboarding.dart';
import '../SignIn/sign_in_view.dart';
import '../Widget/Custom_Container.dart';
import '../Widget/container_color_button.dart';
import '../Widget/container_non_color_button.dart';

class SingUpView extends StatelessWidget {
  const SingUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpCubit = BlocProvider.of<SignUpCubit>(context);
    final cubitDirect = BlocProvider.of<CubitDirectSignIn>(context);
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: CustomTextView(
          color: textColor,
          size: 13,
          text: 'REGISTER',
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PageViewOnBoarding()));
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomContainer(
            child: BlocConsumer<SignUpCubit, SignUpStates>(
              listener: (context, state) {
                if (state is SucsessSignUpState) {
                  signUpCubit.userNameController.clear();
                  signUpCubit.phoneController.clear();
                  signUpCubit.passwordController.clear();
                  signUpCubit.emailController.clear();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PageViewOnBoarding()));
                }
                if (state is FiledSignUpState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.errorMessage!)));
                }
              },
              builder: (context, state) {
                return Form(
                  key: signUpCubit.formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextView(
                        text: 'Create your account',
                        size: 25,
                        color: backGroundColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextView(
                        text:
                            'After your registration is complete, \n you can see our opportunity products.',
                        size: 14,
                        color: textGrayColor,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFromFiled(
                        labelText: 'Username',
                        keyboardType: TextInputType.name,
                        controller: signUpCubit.userNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username can be not empty';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          signUpCubit.userName = value;
                        },
                      ),
                      CustomTextFromFiled(
                        labelText: 'Email',
                        controller: signUpCubit.emailController,
                        secure: false,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'email can be not empty';
                          } else if (!value.contains('@gmail')) {
                            return 'email must contain @gmail.com ';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          signUpCubit.email = value;
                        },
                      ),
                      CustomTextFromFiled(
                        labelText: 'Password',
                        controller: signUpCubit.passwordController,
                        secure: true,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password can be not empty';
                          } else if (value.length < 6) {
                            return 'password must at lest 6 character';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          signUpCubit.password = value;
                        },
                      ),
                      CustomTextFromFiled(
                        labelText: 'Phone',
                        controller: signUpCubit.phoneController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          signUpCubit.phone = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'phone be not empty';
                          } else if (value.length < 11) {
                            return 'The phone must contain 11 number ';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ContainerColorButton(
                        color: buttonContainerColor,
                        onTap: () {
                          if (signUpCubit.formKey.currentState!.validate() &&
                              signUpCubit
                                  .passwordController.value.text.isNotEmpty &&
                              signUpCubit
                                  .emailController.value.text.isNotEmpty) {
                            signUpCubit.register(
                                email: signUpCubit.emailController.value.text,
                                password: signUpCubit.passwordController.value.text,
                                phone: signUpCubit.phoneController.value.text,
                                userName: signUpCubit.userNameController.value.text);
                          }
                          if (state is LoadingSignUpState) {
                            showDialog(
                              context: (context),
                              builder: (context) =>  Center(
                                child:  CircularProgressIndicator(
                                  color: buttonContainerColor,
                                ),
                              ),
                            );
                          }
                          else
                          {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  'Please , Fill The Text Field And Try Again..'),
                              backgroundColor: Colors.red,
                            ));
                          }

                        },

                        text:'Sign Up',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ContainerNonColorButton(
                        onTap: () async {
                          UserCredential sigInGoogle =
                              await cubitDirect.signInWithGoogle();
                          cubitDirect.saveDataInFirestore(
                            userName: sigInGoogle.user!.displayName!,
                            email: sigInGoogle.user!.email!,
                            userId: sigInGoogle.user!.uid,
                          );
                        },
                        selectIcon: false,
                        icon: 'assets/images/google.png',
                        colorBorder: Colors.red,
                        textColor: Colors.red,
                        text: 'Continue with Google ',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ContainerNonColorButton(
                        onTap: () async {
                          UserCredential signInFacebook =
                              await cubitDirect.signInWithFacebook();
                          cubitDirect.saveDataInFirestore(
                            userName: signInFacebook.user!.displayName!,
                            email: signInFacebook.user!.email!,
                            userId: signInFacebook.user!.uid,
                          );
                        },
                        selectIcon: false,
                        icon: 'assets/images/facebook.png',
                        colorBorder: Colors.blue,
                        textColor: Colors.blue,
                        text: 'Continue with Facebook',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: textGrayColor),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignInView()));
                              },
                              child: Text('Sign In',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: buttonContainerColor)))
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

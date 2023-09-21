import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/SignIn/cubit_sign_in.dart';
import 'package:shopping_app/SignIn/state_sign_in.dart';
import '../Core/Constants/colors.dart';
import '../Core/Direct_Sign__In/Sign_In_direct_cubit.dart';
import '../Nav_bar/nav_bar_view.dart';
import '../Register/sign_up_view.dart';
import '../Widget/Custom_Container.dart';
import '../Widget/Custom_TextFromFiled.dart';
import '../Widget/Custom_text.dart';
import '../Widget/container_color_button.dart';
import '../Widget/container_non_color_button.dart';
import 'forgot_password_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubitSignIn = BlocProvider.of<SignInCubit>(context);
    final cubitDirect = BlocProvider.of<CubitDirectSignIn>(context);
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: CustomTextView(
          text: 'Log In',
          color: textColor,
          size: 13,
          textAlign: TextAlign.center,
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SingUpView()));
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
            child: BlocConsumer<SignInCubit, SignInStates>(
                listener: (context, state) {
              if (state is SucessSignInState) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavBarView()));
              }
            }, builder: (context, state) {
              return Form(
                key: cubitSignIn.formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    CustomTextView(
                      text: 'Let’s sign you in',
                      size: 30,
                      color: backGroundColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextView(
                        text: 'Welcome back, you’ve been missed !',
                        size: 14,
                        color: backGroundColor),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextFromFiled(
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: cubitSignIn.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email can not be empty';
                        } else if (!value.contains('@gmail.com')) {
                          return 'email must contain @gmail.com';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        cubitSignIn.emailController.text = value;
                      },
                    ),
                    CustomTextFromFiled(
                      labelText: 'Password',
                      secure: true,
                      keyboardType: TextInputType.emailAddress,
                      controller: cubitSignIn.passwordController,
                      onChanged: (value) {
                        cubitSignIn.passwordController.text = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password can not be empty';
                        } else if (value.length < 6) {
                          return 'password must at lest 6 character';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor:
                                    textGrayColor.withOpacity(0.3),
                              ),
                              child: Checkbox(
                                value: cubitSignIn.isChecked,
                                activeColor: buttonContainerColor,
                                onChanged: cubitSignIn.handleRemeberme,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("Remember Me",
                              style: TextStyle(
                                color: backGroundColor,
                                fontSize: 14,
                              )),
                          const SizedBox(
                            width: 65,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordView()));
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(color: buttonContainerColor),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ContainerColorButton(
                      color: buttonContainerColor,
                      text: 'Sign Up',
                      onTap: () {
                        if (cubitSignIn.formKey.currentState!.validate() &&
                            cubitSignIn.emailController.value.text.isNotEmpty &&
                            cubitSignIn
                                .passwordController.value.text.isNotEmpty) {
                          cubitSignIn.signIn(
                              email: cubitSignIn.emailController.text,
                              password: cubitSignIn.passwordController.text);
                        }
                        if (state is LoadingSignInState) {
                          showDialog(
                            context: (context),
                            builder: (context) => Center(
                              child: CircularProgressIndicator(
                                color: buttonContainerColor,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ContainerNonColorButton(
                      onTap: () async {
                        UserCredential siginGoogle =
                            await cubitDirect.signInWithGoogle();
                        cubitDirect.saveDataInFirestore(
                          userName: siginGoogle.user!.displayName!,
                          email: siginGoogle.user!.email!,
                          userId: siginGoogle.user!.uid,
                        );
                      },
                      text: 'Continue with Google',
                      selectIcon: false,
                      textColor: Colors.red,
                      colorBorder: Colors.red,
                      icon: 'assets/images/google.png',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ContainerNonColorButton(
                      onTap: () async {
                        UserCredential signInFace =
                            await cubitDirect.signInWithFacebook();
                        cubitDirect.saveDataInFirestore(
                          userName: signInFace.user!.displayName!,
                          email: signInFace.user!.email!,
                          userId: signInFace.user!.uid,
                        );
                      },
                      text: 'Continue with Facebook',
                      selectIcon: false,
                      textColor: Colors.blue,
                      colorBorder: Colors.blue,
                      icon: 'assets/images/facebook.png',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(color: textGrayColor, fontSize: 14),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SingUpView()));
                            },
                            child: Text(
                              ' Sign Up',
                              style: TextStyle(
                                  color: buttonContainerColor, fontSize: 14),
                            ))
                      ],
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

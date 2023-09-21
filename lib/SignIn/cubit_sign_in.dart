import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/Core/Constants/const.dart';
import 'package:shopping_app/SignIn/state_sign_in.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(InitSignInState());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
   bool isChecked = false;

  // Login
  void signIn({required String email, required String password}) async {
    emit(LoadingSignInState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoadingSignInState());
      if (userCredential.user?.uid != null) {
        final sharedPref = await SharedPreferences.getInstance();
        sharedPref.setString('userId', userCredential.user!.uid);
        Constant.userId = sharedPref.getString('userId');
        emit(SucessSignInState());
      }
    } on FirebaseAuthException catch (e) {
      emit(FaildSignInState());
    }
  }

//  Forgot password
  void forgotPassword({required String email}) async {
    emit(LoadingForgotPasswordState());
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    emit(SucessForgotPasswordState());
  }

  void handleRemeberme(bool? value) {
    print("Handle Remember Me");
    isChecked = value!;
    SharedPreferences.getInstance().then(
          (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', emailController.text);
        prefs.setString('password', passwordController.text);
      },
    );
    isChecked = value;
    emit(SucessHandelRememberMeState());
  }
}

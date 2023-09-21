import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Register/states_signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitSingUpStates());

  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  String? userName;
  String? email;
  String? password;
  String? phone;

//   Register
  void register({
    required String email,
    required String userName,
    required String password,
    required String phone,
  }) async {
    emit(LoadingSignUpState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user?.uid != null) {
        debugPrint('UserCredential Is Sucsess ${userCredential.user!.uid}');
        if (userCredential.user!.emailVerified == false) {
          User? user = FirebaseAuth.instance.currentUser;
          await user!.sendEmailVerification();
        }
        await sendUserDataToFireStore(
          userName: userName,
          email: email,
          phone: phone,
          userId: userCredential.user!.uid,
        );
        emit(SucsessSignUpState());
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("Field To Register ${e.code}");
      if (e.code == 'email-already-in-use') {
        emit(FiledSignUpState(errorMessage: 'Email already in use'));
      }
      if (e.code == 'weak-password') {
        emit(FiledSignUpState(errorMessage: 'The password is weak'));
      }
    }
  }

  Future<void> sendUserDataToFireStore({
    required String userName,
    required String email,
    required String phone,
    required String userId,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('User').doc(userId).set({
        'userName': userName,
        'email': email,
        'phone': phone,
        'userId': userId,
      });
      emit(SucsessSendDataToFireStore());
    } on FirebaseException catch (e) {
      emit(FiledSendDataToFireStore());
    }
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/On_Boarding/onboarding_cubit.dart';
import 'package:shopping_app/Register/sign_up_view.dart';
import 'Core/Constants/const.dart';
import 'Core/Direct_Sign__In/Sign_In_direct_cubit.dart';
import 'Core/Loading.dart';
import 'Nav_bar/nav_bar_view.dart';
import 'Register/cubit_signup.dart';
import 'SignIn/cheak_email.dart';
import 'SignIn/cubit_sign_in.dart';
import 'SignIn/forgot_password_view.dart';
import 'SignIn/sign_in_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then((value) => debugPrint(value));
  final sharedPref = await SharedPreferences.getInstance();
  Constant.userId = sharedPref.getString('userId');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CubitOnboarding()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => SignInCubit()),
        BlocProvider(create: (context) => CubitDirectSignIn()),
      ],
      child: MaterialApp(
        title: 'Shopping',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => SafeArea(child: child!),
        home:const CheckEmailView(),
         // Constant.userId != null ? const NavBarView() : const SingUpView(),
      ),
    );
  }
}

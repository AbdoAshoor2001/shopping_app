import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/On_Boarding/states.dart';

class CubitOnboarding extends Cubit<OnboardingStates> {
  CubitOnboarding() : super(InitOboarding());

  final pageController = PageController();
  int? pageChanged=0;




}

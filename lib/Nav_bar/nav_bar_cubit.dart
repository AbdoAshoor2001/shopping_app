import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'nav_bar_states.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(InitNavBarState());

  int currentIndex = 0;

  List contant =[
    [
      Icon(Icons.home_outlined)
    ]
  ];
  void changeIndex ( int value) {
    currentIndex = value ;
    emit(InitNavBarState());
  }
}

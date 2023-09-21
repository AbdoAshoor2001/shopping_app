import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_bar_cubit.dart';
import 'nav_bar_states.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit,NavBarStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          bottomNavigationBar: BottomNavigationBar(
            items: [],
          ),
        );
      },
    );
  }
}

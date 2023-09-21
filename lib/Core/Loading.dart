import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants/colors.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textColor,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CupertinoPageScaffold(
            backgroundColor: textColor,
            child: Center(
              child: CupertinoActivityIndicator(
                radius: 20,
                color: buttonContainerColor,
              ),
            ),

          ),
          const SizedBox(height: 15,),
          Text('Loading',style: TextStyle(color: buttonContainerColor,fontSize: 15),)
        ],
      ),
    );
  }
}

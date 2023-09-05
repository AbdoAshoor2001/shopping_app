import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class ContainerColorButton extends StatelessWidget {
  const ContainerColorButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(text,style:const  TextStyle(color: Colors.white,fontSize: 15),)),
      ),
    );
  }
}

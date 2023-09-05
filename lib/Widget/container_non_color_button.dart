import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerNonColorButton extends StatelessWidget {
  const ContainerNonColorButton({
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
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white)
        ),
        child: Center(child: Text(text,style:const  TextStyle(color: Colors.white,fontSize: 15),)),
      ),
    );
  }
}

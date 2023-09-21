import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key, required this.child}) : super(key: key);
final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20))),
        child: SingleChildScrollView(
          child: child,
        )
    ));
  }
}

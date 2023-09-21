import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget {
  const CustomTextView(
      {Key? key,
      required this.text,
      required this.size,
      this.textAlign,
      required this.color})
      : super(key: key);
  final String text;
  final double size;
  final TextAlign? textAlign;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}

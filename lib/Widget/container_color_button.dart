import 'package:flutter/material.dart';

class ContainerColorButton extends StatelessWidget {
  const ContainerColorButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.color,
  }) : super(key: key);
  final void Function() onTap;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 66.0),
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          )),
        ),
      ),
    );
  }
}

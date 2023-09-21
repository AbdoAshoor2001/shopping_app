import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerNonColorButton extends StatefulWidget {
  const ContainerNonColorButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.icon,
    required this.colorBorder,
    required this.textColor,
    required this.selectIcon ,
  }) : super(key: key);
  final void Function() onTap;
  final String text;
  final String? icon;
  final Color colorBorder;
  final Color textColor;
  final bool selectIcon;

  @override
  State<ContainerNonColorButton> createState() =>
      _ContainerNonColorButtonState();
}

class _ContainerNonColorButtonState extends State<ContainerNonColorButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 66.0),
        child: Container(
          height: 44,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: widget.colorBorder)),
          child: Row(
            children: [
              widget.selectIcon
                  ? const SizedBox(width: 90,)
                  : Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 26),
                    child: Image.asset(widget.icon!,width: 11),
                  ),
              Text(
                widget.text,
                style: TextStyle(color: widget.textColor, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

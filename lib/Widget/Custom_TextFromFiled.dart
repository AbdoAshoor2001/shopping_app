import 'package:flutter/material.dart';
import '../Core/Constants/colors.dart';

class CustomTextFromFiled extends StatefulWidget {
  const CustomTextFromFiled({
    Key? key,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.secure = false,
    required this.labelText,
  }) : super(key: key);
  final String labelText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool secure;

  @override
  State<CustomTextFromFiled> createState() => _CustomTextFromFiledState();
}

class _CustomTextFromFiledState extends State<CustomTextFromFiled> {
  late bool secure;

  @override
  void initState() {
    secure = widget.secure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 18, right: 30),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: !widget.secure
              ? const SizedBox()
              : IconButton(
                  icon: Icon(
                    secure ? Icons.visibility_off : Icons.visibility,
                    color: secure ? textGrayColor : buttonContainerColor,
                  ),
                  onPressed: () {
                    setState(() {
                      secure = !secure;
                    });
                  },
                ),

          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: buttonContainerColor,
          )),
          labelText:widget.labelText ,
          labelStyle:  TextStyle(color: backGroundColor,
            fontSize: 16,),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: textGrayColor, width: 5)),

        ),
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        obscureText: secure,

      ),
    );
  }
}

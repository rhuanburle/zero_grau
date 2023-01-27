import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key, required this.prefixIcon, required this.labelText, this.obscureText = false, required this.textEditingController, this.isDense = false})
      : super(key: key);
  final Icon prefixIcon;
  final String labelText;
  final bool obscureText;
  final bool isDense;
  final TextEditingController textEditingController;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: widget.obscureText,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          isDense: widget.isDense,
          prefixIcon: widget.prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        style: TextStyle(fontSize: 16),
      );
  }
}

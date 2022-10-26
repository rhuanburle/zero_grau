import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({Key? key, required this.prefixIcon, required this.labelText})
      : super(key: key);
  final Icon prefixIcon;
  final String labelText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.blue),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
      style: TextStyle(fontSize: 20),
    );
  }
}

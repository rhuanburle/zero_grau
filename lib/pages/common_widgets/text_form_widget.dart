import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  final String? labelText;
  final bool? isDense;

  const TextFormWidget({
    Key? key,
    this.labelText,
    this.isDense = false,
  }) : super(key: key);

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
      decoration: InputDecoration(
        labelText: widget.labelText,
        isDense: widget.isDense,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
        ),
      ),
    );
  }
}

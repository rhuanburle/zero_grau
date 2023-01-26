import 'package:flutter/material.dart';

class TextFormProfile extends StatefulWidget {
  final String? labelText;
  final bool? isDense;
  final TextEditingController textEditingController;
  final Null Function(dynamic value) onChanged;
  final imputFormatters;

  const TextFormProfile({
    Key? key,
    this.labelText,
    this.isDense = false, required this.textEditingController, required this.onChanged, this.imputFormatters ,
  }) : super(key: key);

  @override
  State<TextFormProfile> createState() => _TextFormProfile();
}

class _TextFormProfile extends State<TextFormProfile> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.imputFormatters != null ? [widget.imputFormatters] : null,
      onChanged: widget.onChanged,
      controller: widget.textEditingController,
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

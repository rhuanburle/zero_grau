import 'package:flutter/material.dart';

class FilterHomePage extends StatelessWidget {
  FilterHomePage({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: category == 'Brahma' ? Colors.blue : Colors.blue[100],
      ),
      height: 25,
      width: 100,
      child: Text(
        category,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}

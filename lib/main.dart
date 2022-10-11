import 'package:flutter/material.dart';
import 'package:zero_grau/pages/base/base_screen.dart';
import 'package:zero_grau/pages/common_widgets/user_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero Grau',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BaseScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zero_grau/pages_routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zero Grau',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: PagesRoutes.baseRoute,
      getPages: AppPages.pages,
    );
  }
}

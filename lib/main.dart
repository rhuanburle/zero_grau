import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zero_grau/pages_routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zero_grau/read_firebase/read_firebase.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zero Grau',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: PagesRoutes.loginPage,
      getPages: AppPages.pages,
    );
  }
}

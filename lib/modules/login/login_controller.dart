import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/data/providers/services/auth_service.dart';
import '../../routes/pages_routes.dart';

class LoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final authService = Get.put(AuthService());

  void login() {
    if(emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Erro',
        'Preencha todos os campos',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      authService.signIn(email: emailController.text, password: passwordController.text).then((value) => {
        if(value == "Signed in") {
          Get.toNamed(PagesRoutes.baseRoute)
        } else {
          Get.snackbar(
            'Erro',
            'Email ou senha incorretos',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          )
        }
      });
    }
  }

}
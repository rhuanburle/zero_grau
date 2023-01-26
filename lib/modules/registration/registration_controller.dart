import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/providers/services/auth_service.dart';
import '../../routes/pages_routes.dart';
import '../cadastro/widgets/dialog_confirm_register.dart';

class RegistrationController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  AuthService authService = Get.put(AuthService());

  void register(context) {
    if (passwordController.text == confirmPasswordController.text) {
      if (emailController.text.isNotEmpty ||
          passwordController.text.isNotEmpty) {
        sendNewUser(context);
      } else {
        Get.snackbar(
          'Erro',
          'Preencha todos os campos',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        'Erro',
        'As senhas não coincidem',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void sendNewUser(context) async {
    authService.signUp(email: emailController.text, password: passwordController.text).then((value) => {
      if (value == "Signed up") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return DialogConfirmRegister();
          },
        )
      } else {
        Get.snackbar("Erro", 'Email ou senha incorretos',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white)
      }
    });
  }
}
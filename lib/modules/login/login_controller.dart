import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/data/providers/services/auth_service.dart';
import '../../data/providers/firestore_service.dart';
import '../../routes/pages_routes.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final firestoreService = Get.put(FireStoreService());
  final authService = Get.put(AuthService());

  void login(context) async {
    bool isFirstLogin;
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Erro',
        'Preencha todos os campos',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      await authService
          .signIn(
              email: emailController.text, password: passwordController.text)
          .then((value) async => {
                if (value == "Signed in")
                  {
                    await firestoreService.readAllProductsFireStore(),
                    isFirstLogin = await firestoreService.searchUserFireStore(),
                    if (isFirstLogin == true)
                      {
                       await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Bem vindo ao Zero Grau!"),
                              content: Text("Para continuar, preencha seu perfil"),
                              actions: [
                                TextButton(
                                  child: Text("Ok"),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        Get.offAndToNamed(PagesRoutes.profileRoute, arguments: true),
                      }
                    else
                      {Get.toNamed(PagesRoutes.baseRoute)}
                  }
                else
                  {
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
    // clearFields();
  }

  clearFields() {
    emailController.clear();
    passwordController.clear();
  }
}

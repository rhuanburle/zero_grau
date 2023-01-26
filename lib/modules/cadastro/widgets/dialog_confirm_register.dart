import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/modules/cadastro/profile_controller.dart';
import '../../../routes/pages_routes.dart';

class DialogConfirmRegister extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Cadastro realizado com sucesso!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Você será redirecionado para a página de login.'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Ok'),
          onPressed: () {
            Get.toNamed(PagesRoutes.loginPage);
          },
        ),
      ],
    );
  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/modules/registration/registration_controller.dart';
import '../../utils/common_widgets/customTextField.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);
  final ctrl = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomTextField(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                textEditingController: ctrl.emailController,

              ),
              SizedBox(height: 20),
              CustomTextField(
                obscureText: true,
                prefixIcon: Icon(Icons.lock),
                labelText: 'Senha',
                textEditingController: ctrl.passwordController,
              ),
              SizedBox(height: 20),
              CustomTextField(
                obscureText: true,
                prefixIcon: Icon(Icons.lock),
                labelText: 'Repita a senha',
                textEditingController: ctrl.confirmPasswordController,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    ctrl.register(context);
                  },
                  child: Text('Cadastrar', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

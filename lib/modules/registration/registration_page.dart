import 'package:flutter/material.dart';
import '../login/customTextField.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

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
              ),
              SizedBox(height: 20),
              CustomTextField(
                prefixIcon: Icon(Icons.person),
                labelText: 'Nome',
              ),
              SizedBox(height: 20),
              CustomTextField(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Celular',
              ),
              SizedBox(height: 20),
              CustomTextField(
                prefixIcon: Icon(Icons.file_copy),
                labelText: 'CPF',
              ),
              SizedBox(height: 20),
              CustomTextField(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
              ),
              SizedBox(height: 20),
              CustomTextField(
                prefixIcon: Icon(Icons.add_road),
                labelText: 'Endereço',
              ),
              SizedBox(height: 20),
              CustomTextField(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Senha',
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {},
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

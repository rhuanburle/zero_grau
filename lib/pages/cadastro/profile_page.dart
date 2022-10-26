import 'package:flutter/material.dart';

import '../common_widgets/text_form_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormWidget(labelText: 'Nome'),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormWidget(labelText: 'Email'),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormWidget(labelText: 'Telefone'),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormWidget(labelText: 'Endereço'),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormWidget(labelText: 'Senha'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.save,
                    ),
                    label: Text('Salvar Modificações'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
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

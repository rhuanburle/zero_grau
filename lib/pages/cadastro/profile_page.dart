import 'package:flutter/material.dart';

import 'common_widgets_profile/text_form_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.save),
        label: Text('Salvar Modificações'),
      ),
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Nome'),
            ),
            TextFormWidget(labelText: 'Nome'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Email'),
            ),
            TextFormWidget(labelText: 'Email'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Telefone'),
            ),
            TextFormWidget(labelText: 'Telefone'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Senha'),
            ),
            TextFormWidget(labelText: 'Senha'),
          ],
        ),
      ),
    );
  }
}

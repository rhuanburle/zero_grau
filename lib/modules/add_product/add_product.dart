import 'package:flutter/material.dart';
import '../common_widgets/text_form_widget.dart';
import 'add_product_controller.dart';

class AddProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final crtl = AddProductController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Produtos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Adicione as informações do produto que deseja cadastrar.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormWidget(labelText: 'Nome do produto', isDense: true),
              SizedBox(height: 10),
              TextFormWidget(labelText: 'Preço', isDense: true),
              SizedBox(height: 10),
              TextFormWidget(labelText: 'imagem', isDense: true),
              SizedBox(height: 10),
              TextFormWidget(labelText: 'Descrição', isDense: true),
              SizedBox(height: 10),
              TextFormWidget(labelText: 'Categoria', isDense: true),
              SizedBox(height: 10),
              TextFormWidget(labelText: 'Marca', isDense: true),
              SizedBox(height: 10),
              TextFormWidget(labelText: 'Unidade', isDense: true),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Alcoólico?',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 20),
                  Text('Sim'),
                  Radio(value: true, groupValue: '', onChanged: (value) {}),
                  Text('Não'),
                  Radio(value: false, groupValue: '', onChanged: (value) {}),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    crtl.forItens();
                  },
                  icon: Icon(
                    Icons.add,
                  ),
                  label: Text('Adicionar Produto'),
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
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/utils/app_images.dart';
import '../../utils/common_widgets/text_form_widget.dart';
import 'add_product_controller.dart';

class AddProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = AddProductController();
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
              TextFormWidget(labelText: 'Nome do produto',
                isDense: true,
                textEditingController: ctrl.nameProductController,),
              SizedBox(height: 10),
              TextFormWidget(labelText: 'Preço',
                  isDense: true,
                  textEditingController: ctrl.priceController),
              SizedBox(height: 10),
              TextFormWidget(labelText: 'Descrição',
                  isDense: true,
                  textEditingController: ctrl.descriptionController),
              SizedBox(height: 10),
              TextFormWidget(labelText: 'Categoria',
                  isDense: true,
                  textEditingController: ctrl.categoryController),
              SizedBox(height: 10),
              TextFormWidget(labelText: 'Marca',
                  isDense: true,
                  textEditingController: ctrl.brandController),
              SizedBox(height: 10),
              TextFormWidget(
                  labelText: 'Tamanho (ex: 1kg, 2kg, 2L, 350ml.....)',
                  isDense: true,
                  textEditingController: ctrl.sizeController),
              SizedBox(height: 10),
              TextFormWidget(labelText: 'Unidade',
                  isDense: true,
                  textEditingController: ctrl.unitController),
              SizedBox(height: 10),
              TextFormWidget(labelText: 'Quantidade em Estoque',
                  isDense: true,
                  textEditingController: ctrl.stockQtyController),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Alcoólico?',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 20),
                  Text('Não'),
                  Obx(() {
                    return Switch(
                      value: ctrl.isAlcoholic.value,
                      onChanged: (value) {
                        ctrl.isAlcoholic.value = value;
                      },
                    );
                  }),
                  Text('Sim'),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 110,
                    width: 110,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(AppImage.noImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    ctrl.getProductImage();
                  }, child: Text('Escolher imagem'))
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ctrl.sendNewProduct();
                    // ctrl.forItens();
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

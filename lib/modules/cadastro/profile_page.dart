import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/modules/cadastro/profile_controller.dart';
import 'package:zero_grau/modules/cadastro/widgets/text_form_profile.dart';
import '../../utils/common_widgets/customTextField.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ctrl = Get.put(ProfileController());

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
              CustomTextField(labelText: 'Nome', isDense: true ,prefixIcon: Icon(Icons.person), textEditingController: ctrl.nameController,),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              CustomTextField(labelText: 'Telefone',isDense: true, prefixIcon: Icon(Icons.phone), textEditingController: ctrl.phoneController,),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Cep', isDense: true, textEditingController: ctrl.zipCodeController, imputFormatters: ctrl.cepMask ,onChanged: (value) {
                ctrl.zipCodeController.text.length == 9
                    ? ctrl.searchCep()
                    : null;              },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Rua', isDense: true, textEditingController: ctrl.streetAddressController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'numero',isDense: true, textEditingController: ctrl.numberController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Complemento',isDense: true, textEditingController: ctrl.complementController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Bairro',isDense: true, textEditingController: ctrl.neighborhoodController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Cidade', isDense: true, textEditingController: ctrl.cityController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Estado',isDense: true, textEditingController: ctrl.stateController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Ponto de referencia',isDense: true, textEditingController: ctrl.referencePointController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ctrl.saveProfile(context);
                    },
                    icon: Icon(
                      Icons.save,
                    ),
                    label: Text('Salvar Dados'),
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

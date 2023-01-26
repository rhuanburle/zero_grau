import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/modules/cadastro/profile_controller.dart';
import 'package:zero_grau/modules/cadastro/widgets/text_form_profile.dart';
import 'package:zero_grau/utils/common_widgets/text_form_widget.dart';
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
              CustomTextField(labelText: 'Nome', prefixIcon: Icon(Icons.person), textEditingController: ctrl.nameController,),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              CustomTextField(labelText: 'Email', prefixIcon: Icon(Icons.email), textEditingController: ctrl.emailController,),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              CustomTextField(labelText: 'Telefone', prefixIcon: Icon(Icons.phone), textEditingController: ctrl.phoneController,),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Cep', textEditingController: ctrl.zipCodeController, imputFormatters: ctrl.cepMask ,onChanged: (value) {
                ctrl.zipCodeController.text.length == 9
                    ? ctrl.searchCep()
                    : null;              },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Rua', textEditingController: ctrl.streetAddressController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'numero', textEditingController: ctrl.numberController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Complemento', textEditingController: ctrl.complementController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Bairro', textEditingController: ctrl.neighborhoodController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Cidade', textEditingController: ctrl.cityController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Estado', textEditingController: ctrl.stateController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              TextFormProfile(labelText: 'Ponto de referencia', textEditingController: ctrl.referencePointController, onChanged: (value) {  },),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ctrl.searchCep();
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

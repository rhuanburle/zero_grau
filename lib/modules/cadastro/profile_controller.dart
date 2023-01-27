import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:search_cep/search_cep.dart';

import '../../data/providers/firestore_service.dart';

class ProfileController extends GetxController {

  bool firstLogin = Get.arguments;
  final firestoreService = Get.find<FireStoreService>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController referencePointController = TextEditingController();

  MaskTextInputFormatter cepMask = MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});



  void searchCep() async {
    final viaCepSearchCep = ViaCepSearchCep();
    String _cep = zipCodeController.text.replaceAll('-', '');
    final infoCepJSON = await viaCepSearchCep.searchInfoByCep(cep: _cep);
    print(infoCepJSON);
    try {
      infoCepJSON.forEach((r) {
        streetAddressController.text = r.logradouro.toString();
        neighborhoodController.text = r.bairro.toString();
        cityController.text = r.localidade.toString();
        stateController.text = r.uf.toString();
      });
    } catch (e) {
      print(e);
    }
  }

  saveProfile() {
    firestoreService.sendUserFireStore(
      {
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'zipCode': zipCodeController.text,
        'streetAddress': streetAddressController.text,
        'city': cityController.text,
        'state': stateController.text,
        'number': numberController.text,
        'complement': complementController.text,
        'neighborhood': neighborhoodController.text,
        'referencePoint': referencePointController.text,
      },
    );
  }
}
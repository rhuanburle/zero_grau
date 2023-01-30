import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/providers/firestore_service.dart';

class AddProductController extends GetxController {
  var dataFirestore = FireStoreService();
  RxBool isAlcoholic = false.obs;
  var imageProduct;

  TextEditingController nameProductController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController stockQtyController = TextEditingController();

  void sendNewProduct() {
    if (
    nameProductController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        brandController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        categoryController.text.isNotEmpty &&
        unitController.text.isNotEmpty &&
        sizeController.text.isNotEmpty &&
        stockQtyController.text.isNotEmpty
    ) {
      try {
        dataFirestore.sendNewProducts({
          'name': nameProductController.text,
          'price': priceController.text,
          'image': imageProduct,
          'description': descriptionController.text,
          'category': categoryController.text,
          'brand': brandController.text,
          'unit': unitController.text,
          'size': sizeController.text,
          'alcoolic': isAlcoholic.value,
          'stockQty': stockQtyController.text,
        });
      } catch (e) {
        print(e);
      }
    } else {
      Get.snackbar(
        'Erro', 'Preencha todos os campos', snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,);
    }
  }
  void getProductImage() async {
    imageProduct = await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}

// void forItens() {
//   sendItens.forEach((i) {
//     // deleteProducts(i);
//     sendProducts(i);
//   });
// }
// void sendProducts(i) {
//   String id = Uuid().v1();
//   products
//       .collection(Constants.products)
//       .doc(id)
//       .set(i)
//       .then((value) => print("User Added"))
//       .catchError((error) => print("Failed to add user: $error"));
// }
//
// void deleteProducts(i) {
//   products
//       .collection(Constants.products)
//       .get()
//       .then((QuerySnapshot querySnapshot) {
//     querySnapshot.docs.forEach((doc) {
//       doc.reference.delete();
//     });
//   });
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zero_grau/models/products_model.dart';
import 'package:get/get.dart';

import '../../../read_firebase/read_firebase.dart';

class OthersPageController extends GetxController {
  var readFirebase = ReadFirebase();

  FirebaseFirestore products = FirebaseFirestore.instance;
  List productsList = [];

  Future readProductsOthers() async {
    await products
        .collection('products')
        // .where('alcoolic', isEqualTo: false)
        .where('category', isEqualTo: 'outros')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        productsList.add(
          ProductsModel(
            id: result.id,
            name: result.get('name'),
            brand: result.get('brand'),
            unit: result.get('unit'),
            category: result.get('category'),
            alcoolic: result.get('alcoolic'),
            description: result.get('description'),
            image: result.get('image'),
            price: result.get('price'),
            size: result.get('size'),
          ),
        );
      });
    });
    return productsList;
  }
}

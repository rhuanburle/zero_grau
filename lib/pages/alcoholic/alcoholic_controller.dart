import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/models/products_model.dart';
import 'package:zero_grau/read_firebase/read_firebase.dart';
import 'package:zero_grau/models/app_data/app_data.dart' as appData;

import '../base/components/alert_dialog_cart.dart';

class AlcoholicControlle extends GetxController {
  var readFirebase = ReadFirebase();
  FirebaseFirestore products = FirebaseFirestore.instance;
  List productsList = [];

  Future readProductsAlcoolic() async {
    await products
        .collection('products')
        .where('alcoolic', isEqualTo: true)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        productsList.add(
          ProductsModel(
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

  showDialogCart(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogCart();
      },
    );
  }

  readCartItens() {}
}

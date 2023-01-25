import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:zero_grau/constants/constants.dart' as Constants;
import '../../data/models/app_data/app_data.dart';

class AddProductController extends GetxController {
  FirebaseFirestore products = FirebaseFirestore.instance;

  void forItens() {
    sendItens.forEach((i) {
      sendProducts(i);
    });
  }

  void sendProducts(i) {
    String id = Uuid().v1();
    products
        .collection(Constants.products)
        .doc(id)
        .set(i)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

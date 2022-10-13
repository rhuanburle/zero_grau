import 'package:cloud_firestore/cloud_firestore.dart';

class ReadFirebase {
  FirebaseFirestore products = FirebaseFirestore.instance;
  List productsList = [];

  Future readProducts() async {
    await products.collection('products').get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        productsList.add(result.data());
      });
    });
    print(productsList);
    return productsList;
  }

  void refresh() async {
    QuerySnapshot querySnapshot = await products.collection('products').get();

    var listNames = [];
    querySnapshot.docs.forEach((result) {
      String name = result.get("name");
      listNames.add(name);
    });
    print(listNames);
  }
}

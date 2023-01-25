import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:zero_grau/utils/hive_config.dart';
import '../../data/models/products_model.dart';


class BasePagesController extends GetxController {
  List productsList = [];
  FirebaseFirestore products = FirebaseFirestore.instance;
  HiveConfig hiveConfig = HiveConfig();

  List productAlcoolicList = [];
  List productNoAlcoolicList = [];
  List productOthersList = [];

  readProductsFireBase() async {
    await products
        .collection('products')
        // .where('category', isEqualTo: 'outros')
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
    await hiveConfig.saveData(key: 'products', data: productsList);
    await filterProducts(productsList);
    // productsList = await hiveConfig.getData(key: 'products');
  }

  filterProducts(productsList) async {
    for (var i = 0; i < productsList.length; i++) {
      if (productsList[i].alcoolic == true) {
        productAlcoolicList.add(productsList[i]);
      } else if (productsList[i].alcoolic == false &&
          productsList[i].category == 'outros') {
        productOthersList.add(productsList[i]);
      } else {
        productNoAlcoolicList.add(productsList[i]);
      }
    }
    await hiveConfig.saveData(
        key: 'productAlcoolic', data: productAlcoolicList);
    await hiveConfig.saveData(
        key: 'productNoAlcoolic', data: productNoAlcoolicList);
    await hiveConfig.saveData(key: 'productOthers', data: productOthersList);
  }

  void refresh() async {
    QuerySnapshot querySnapshot = await products.collection('products').get();

    var listNames = [];
    querySnapshot.docs.forEach((result) {
      String name = result.get("name");
      listNames.add(name);
    });
  }
}

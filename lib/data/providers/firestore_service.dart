import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../../utils/hive_config.dart';
import '../models/products_model.dart';
import '../models/user_model.dart';
import 'package:zero_grau/constants/constants.dart' as Constants;


class FireStoreService {
  FirebaseFirestore dataFirestore = FirebaseFirestore.instance;
  HiveManager hiveManager = HiveManager();
  UserModel userComplete = UserModel();

  List productsList = [];
  List productAlcoolicList = [];
  List productNonAlcoolicList = [];
  List productOthersList = [];

  sendProductsFireStore() async {
    final AddproductsList = await hiveManager.getData(key: 'products');
    for (var i = 0; i < AddproductsList.length; i++) {
      await dataFirestore.collection('products').add({
        'name': productsList[i].name,
        'brand': productsList[i].brand,
        'unit': productsList[i].unit,
        'category': productsList[i].category,
        'alcoolic': productsList[i].alcoolic,
        'description': productsList[i].description,
        'image': productsList[i].image,
        'price': productsList[i].price,
        'size': productsList[i].size,
      });
    }
  }

  sendUserFireStore(registrationUser) async {
    var isUserComplete;
    try {
      await dataFirestore.collection('users').add({
        'name': registrationUser['name'],
        'email': registrationUser['email'],
        'phone': registrationUser['phone'],
        'zipCode': registrationUser['zipCode'],
        'streetAddress': registrationUser['streetAddress'],
        'city': registrationUser['city'],
        'state': registrationUser['state'],
        'number': registrationUser['number'],
        'complement': registrationUser['complement'],
        'neighborhood': registrationUser['neighborhood'],
        'referencePoint': registrationUser['referencePoint'],
        'token': registrationUser['token'],
        'createAt': DateTime.now(),
        'updateAt': DateTime.now(),
        'deleteAt': "",
        'status': 'active',
      }).then((value) {
        if (value.id != null) {
          isUserComplete = true;
        } else {
          isUserComplete = false;
        }
      });
    } catch (e) {
      print(e);
      return false;
    }
    return isUserComplete;
  }

  Future<bool> searchUserFireStore() async {
    final email = await hiveManager.getData(key: 'userEmail');
    var isFirstLogin;
    await dataFirestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((user) {
          if(user.docs.length == 0) {
             isFirstLogin = true;
          } else {
             isFirstLogin = false;
          }
    });
    return isFirstLogin;
  }

  readUserFireStore(email) async {
    try {
      await dataFirestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          userComplete = UserModel(
            id: result.id,
            name: result.get('name'),
            email: result.get('email'),
            phone: result.get('phone'),
            zipCode: result.get('zipCode'),
            streetAddress: result.get('streetAddress'),
            number: result.get('number'),
            complement: result.get('complement'),
            neighborhood: result.get('neighborhood'),
            city: result.get('city'),
            state: result.get('state'),
            token: result.get('token'),
            createdAt: result.get('createAt'),
            updatedAt: result.get('updateAt'),
            deletedAt: result.get('deleteAt'),
            status: result.get('status'),
            role: 'TO DO',
          );
        });
      });
    } catch (e) {
      print(e);
    }
  }

  readAllProductsFireStore() async {
    await dataFirestore
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
    await hiveManager.saveData(key: 'products', data: productsList);
    await filterProducts(productsList);
  }

  filterProducts(productsList) async {
    for (var i = 0; i < productsList.length; i++) {
      if (productsList[i].alcoolic == true) {
        productAlcoolicList.add(productsList[i]);
      } else if (productsList[i].alcoolic == false &&
          productsList[i].category == 'outros') {
        productOthersList.add(productsList[i]);
      } else {
        productNonAlcoolicList.add(productsList[i]);
      }
    }
    await hiveManager.saveData(
        key: 'productAlcoolic', data: productAlcoolicList);
    await hiveManager.saveData(
        key: 'productNoAlcoolic', data: productNonAlcoolicList);
    await hiveManager.saveData(key: 'productOthers', data: productOthersList);
  }

  void refresh() async {
    QuerySnapshot querySnapshot = await dataFirestore.collection('products').get();
    var listNames = [];
    querySnapshot.docs.forEach((result) {
      String name = result.get("name");
      listNames.add(name);
    });
    print(listNames);
  }

  void sendNewProducts(i) {
    String id = Uuid().v1();
    dataFirestore
        .collection(Constants.products)
        .doc(id)
        .set(i)
        .then((value) => print("$i added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void deleteProducts(i) {
    dataFirestore
        .collection(Constants.products)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }
}

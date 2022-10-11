import 'package:zero_grau/models/products_model.dart';
import 'package:zero_grau/models/app_data/app_data.dart' as appData;
import 'package:get/get.dart';

class NoAlcoholicController extends GetxController {
  Future findNoAlcoolic() async {
    List<ProductsModel> noAlcoolicList = await appData.productsItems
        .where((element) =>
            element.alcoolic == false && element.category != 'outros')
        .toList();
    return noAlcoolicList;
  }
}

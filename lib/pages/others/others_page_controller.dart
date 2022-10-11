import 'package:zero_grau/models/products_model.dart';
import 'package:zero_grau/models/app_data/app_data.dart' as appData;
import 'package:get/get.dart';

class OthersPageController extends GetxController {
  Future findOthers() async {
    List<ProductsModel> othersList = await appData.productsItems
        .where((element) =>
            element.alcoolic == false && element.category == 'outros')
        .toList();
    return othersList;
  }
}

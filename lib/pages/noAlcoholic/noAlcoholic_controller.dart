import 'package:zero_grau/models/products_model.dart';
import 'package:zero_grau/models/app_data/app_data.dart' as appData;

class NoAlcoholicControlle {
  List<ProductsModel> noAlcoolicList = appData.productsItems
      .where((element) => element.alcoolic == false)
      .toList();
}

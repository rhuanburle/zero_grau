import 'package:zero_grau/models/products_model.dart';
import 'package:zero_grau/models/app_data/app_data.dart' as appData;

class AlcoholicControlle {
  List<ProductsModel> alcoolicList = appData.productsItems
      .where((element) => element.alcoolic == true)
      .toList();
}
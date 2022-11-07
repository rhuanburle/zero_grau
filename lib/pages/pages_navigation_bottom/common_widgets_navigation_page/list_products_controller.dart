import 'package:get/get.dart';
import 'package:zero_grau/models/cart_model.dart';
import 'package:zero_grau/pages/base/base_creen_controller.dart';
import 'package:zero_grau/utils/utils_services.dart';

class ListProductsController extends GetxController {
  BaseScreenController ctrl = BaseScreenController();
  UtilServices utilServices = UtilServices();
  RxInt resultCount = 0.obs;

  void addProductCount(d) {
    resultCount.value++;
  }

  void decreaseProductCount(id) {
    if (resultCount.value > 0) {
      resultCount.value--;
    } else {
      resultCount.value = 0;
    }
  }

  // void addProductCart(id, name, description, price, count) {
  //   if (ctrl.cartList.isEmpty) {
  //     ctrl.cartList.add(CartModel(
  //       id: id,
  //       name: name,
  //       price: double.parse(price),
  //       quantity: count,
  //       totalPrice: totalPrice(price, count),
  //     ));
  //   } else {
  //     ctrl.cartList.forEach((element) {
  //       if (element.id == id) {
  //         element.quantity.value = resultCount.value;
  //         element.totalPrice = element.price * element.quantity.value;
  //       } else {
  //         ctrl.cartList.add(CartModel(
  //           id: id,
  //           name: name,
  //           price: double.parse(price),
  //           quantity: count,
  //           totalPrice: totalPrice(price, count),
  //         ));
  //       }
  //     });
  //   }
  // }

  totalPrice(price, count) {
    return double.parse(price) * count.value;
  }
}

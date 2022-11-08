import 'package:get/get.dart';
import 'package:zero_grau/models/cart_model.dart';
import 'package:zero_grau/pages/base/base_creen_controller.dart';
import 'package:zero_grau/utils/utils_services.dart';

class ListProductsController extends GetxController {
  RxInt counter = 0.obs;
  UtilServices utilServices = UtilServices();
  BaseScreenController ctrl = BaseScreenController();
  List<CartModel> cartList = [];

  void addProductCart(product) {
    if (cartList.isEmpty) {
      cartList.add(CartModel(
        id: product.id,
        name: product.name,
        price: product.price,
        quantity: 1.obs,
        totalPrice: totalPrice(product.price, 1.obs),
      ));
    } else if (cartList.any((element) => element.id == product.id)) {
      cartList.forEach((element) {
        if (element.id == product.id) {
          element.quantity++;
          element.totalPrice = totalPrice(element.price, element.quantity);
        }
        counter = element.quantity;
      });
    } else {
      cartList.add(CartModel(
        id: product.id,
        name: product.name,
        price: product.price,
        quantity: 1.obs,
        totalPrice: totalPrice(product.price, 1.obs),
      ));
    }
    ;
  }

  decreaseProductCart(String id) {
    cartList.any((element) => element.id == id)
        ? cartList.forEach((element) {
            if (element.id == id) {
              element.quantity--;
              element.totalPrice = totalPrice(element.price, element.quantity);
            }
            if (element.quantity == 0) {
              cartList.remove(element);
            }
          })
        : null;
  }

  totalPrice(price, quantity) {
    return price * quantity.value;
  }

  searchCountProduct(id) {
    cartList.forEach((element) {
      if (element.id == id) {
        counter = element.quantity;
      } else {
        counter = 0.obs;
      }
    });
  }
}

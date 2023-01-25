import 'package:get/get.dart';
import 'package:zero_grau/utils/utils_services.dart';
import '../../../data/models/cart_model.dart';
import '../../base/base_creen_controller.dart';

class ListProductsController extends GetxController {
  RxInt counter = 0.obs;
  UtilServices utilServices = UtilServices();
  BaseScreenController ctrl = BaseScreenController();
  RxList cartList = [].obs;
  RxDouble totalPriceCart = 0.0.obs;

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
    calcTotalPriceCart(product.price);
  }

  calcTotalPriceCart(price) async {
    if (cartList.isNotEmpty) {
      totalPriceCart.value += price;
      print(totalPriceCart.value);
    }
  }

  decreaseProductCart(product) {
    cartList.any((element) => element.id == product.id)
        ? cartList.forEach((element) {
            if (element.id == product.id) {
              element.quantity--;
              element.totalPrice = totalPrice(element.price, element.quantity);
              totalPriceCart.value -= product.price;
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

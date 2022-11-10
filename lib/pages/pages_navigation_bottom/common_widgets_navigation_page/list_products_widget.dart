import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/models/app_data/app_data.dart';
import 'package:zero_grau/models/products_model.dart';
import 'package:zero_grau/pages/pages_navigation_bottom/common_widgets_navigation_page/list_products_controller.dart';

import '../../../utils/utils_services.dart';

class ListProductsWidget extends StatelessWidget {
  final ProductsModel product;
  UtilServices utilServices = UtilServices();
  ListProductsController ctrl = Get.put(ListProductsController());

  ListProductsWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          color: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.description,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            'R\$ ${product.price}',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: () {
                              ctrl.decreaseProductCart(product);
                            },
                            icon: const Icon(
                              Icons.do_not_disturb_on,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 50,
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey[300]!, width: 2),
                                ),
                                child: Text(
                                  ctrl.cartList.any(
                                          (element) => element.id == product.id)
                                      ? ctrl.cartList
                                          .firstWhere((element) =>
                                              element.id == product.id)
                                          .quantity
                                          .toString()
                                      : 0.obs.toString(),
                                  // ctrl.counter.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700),
                                )),
                          ),
                          IconButton(
                            onPressed: () {
                              ctrl.addProductCart(product);
                            },
                            icon: const Icon(
                              Icons.add_circle_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 110,
                  width: 110,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(product.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

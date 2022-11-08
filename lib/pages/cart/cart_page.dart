import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/models/app_data/app_data.dart' as appData;
import 'package:zero_grau/pages/cart/components_cart/alert_dialog_orders.dart';

import '../pages_navigation_bottom/common_widgets_navigation_page/list_products_controller.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  final listProductsCtrl = Get.put(ListProductsController());

  @override
  Widget build(BuildContext context) {
    showDialogOrders() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogOrders();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listProductsCtrl.cartList.length,
              itemBuilder: (_, index) {
                return Card(
                    color: Colors.grey[100],
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          listProductsCtrl.cartList[index].name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                            'R\$ ' +
                                listProductsCtrl.cartList[index].price
                                    .toString(),
                            style: const TextStyle(fontSize: 14)),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('R\$  ', style: TextStyle(fontSize: 16)),
                          SizedBox(
                            width: 70,
                            height: 35,
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey[300]!, width: 2),
                                ),
                                child: Text(
                                  listProductsCtrl.cartList[index].totalPrice
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700),
                                )),
                          ),
                          IconButton(
                            onPressed: () {
                              listProductsCtrl.decreaseProductCart(
                                  listProductsCtrl.cartList[index].id);
                            },
                            icon: const Icon(
                              Icons.do_not_disturb_on,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 35,
                            height: 30,
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.grey[300]!, width: 2),
                                ),
                                child: Text(
                                  listProductsCtrl.cartList[index].quantity
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700),
                                )),
                          ),
                          IconButton(
                            onPressed: () {
                              listProductsCtrl.addProductCart(
                                  listProductsCtrl.cartList[index]);
                            },
                            icon: const Icon(
                              Icons.add_circle_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                      Text('R\$ 48,00',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 50,
                  width: 180,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialogOrders();
                    },
                    icon: Icon(
                      Icons.check_circle,
                    ),
                    label: Row(
                      children: [
                        Text('Finalizar Pedido',
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pages_routes/app_pages.dart';
import '../../pages_navigation_bottom/common_widgets_navigation_page/list_products_controller.dart';

class AlertDialogCart extends StatelessWidget {
  AlertDialogCart({Key? key}) : super(key: key);
  final listProductsCtrl = Get.put(ListProductsController());

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: const Text('Confirmar os produtos do carrinho?'),
      children: [
        Column(
          children: [
            SizedBox(
              width: 300,
              height: 200,
              child: ListView.builder(
                itemCount: listProductsCtrl.cartList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(listProductsCtrl.cartList[index].name),
                    subtitle: Text(
                        'R\$ ${listProductsCtrl.cartList[index].totalPrice.toStringAsFixed(2)}'),
                    trailing: Text(
                        'Quantidade: ${listProductsCtrl.cartList[index].quantity}'),
                  );
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Não'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.toNamed(PagesRoutes.cartRoute);
                    },
                    child: const Text('Sim'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

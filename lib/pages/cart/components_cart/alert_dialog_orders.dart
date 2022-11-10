import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zero_grau/pages/pages_navigation_bottom/common_widgets_navigation_page/list_products_controller.dart';

class AlertDialogOrders extends StatelessWidget {
  final ctrl = Get.put(ListProductsController());
  AlertDialogOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: const Text('Finalizar Pedido?'),
      content: Text(
        'Valor Total:\ R\$ ${ctrl.totalPriceCart.toStringAsFixed(2)}',
        style: TextStyle(fontSize: 18),
      ),
      actions: [
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
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
    );
  }
}

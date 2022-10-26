import 'package:flutter/material.dart';

class AlertDialogOrders extends StatelessWidget {
  const AlertDialogOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: const Text('Finalizar Pedido?'),
      content: const Text('Valor Total: R\$ 0,00'),
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

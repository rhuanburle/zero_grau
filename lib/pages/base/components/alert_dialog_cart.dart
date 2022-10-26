import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pages_routes/app_pages.dart';

class AlertDialogCart extends StatelessWidget {
  const AlertDialogCart({Key? key}) : super(key: key);

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
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Cerveja'),
                    subtitle: const Text('R\$ 5,00'),
                    trailing: const Text('1'),
                  ),
                  ListTile(
                    title: const Text('Coca-Cola 2L'),
                    subtitle: const Text('R\$ 16,00'),
                    trailing: const Text('2'),
                  ),
                  ListTile(
                    title: const Text('Carvão'),
                    subtitle: const Text('R\$ 12,00'),
                    trailing: const Text('1'),
                  ),
                ],
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

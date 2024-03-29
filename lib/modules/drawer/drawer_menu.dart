import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/pages_routes.dart';
import 'drawer_controller.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu({Key? key}) : super(key: key);
  final ctrl = Get.put(DrawerMenuController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Zero Grau',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'versão 1.0.0',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Get.toNamed(PagesRoutes.baseRoute);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Cadastro'),
              onTap: () {
                Get.toNamed(PagesRoutes.profileRoute, arguments: false);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Carrinho'),
              onTap: () {
                Get.toNamed(PagesRoutes.cartRoute);
              },
            ),
            ListTile(
              leading: Icon(Icons.my_library_books_outlined),
              title: Text('Meus Pedidos'),
              onTap: () {
                Get.toNamed(PagesRoutes.loginPage);
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text('Endereços Cadastrados'),
              onTap: () {},
            ),
            SizedBox(height: 50),
            Divider(
              // color: Colors.black,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () {
                ctrl.exitAccount();
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Adicionar Produto'),
              onTap: () {
                Get.toNamed(PagesRoutes.addProducts);
              },
            ),
          ],
        ),
      );
  }
}

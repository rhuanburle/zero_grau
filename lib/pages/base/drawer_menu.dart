import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
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
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Cadastro'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Carrinho'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.my_library_books_outlined),
            title: Text('Meus Pedidos'),
            onTap: () {},
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

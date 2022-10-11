import 'package:flutter/material.dart';
import 'package:zero_grau/models/app_data/app_data.dart' as appData;

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 200,
        height: 80,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('R\$ 48,00', style: const TextStyle(fontSize: 18)),
              SizedBox(
                height: 5,
              ),
              Text('Finalizar Pedido', style: const TextStyle(fontSize: 16)),
            ],
          ),
          icon: Icon(Icons.check_circle),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: ListView.builder(
        itemCount: appData.cartList.length,
        itemBuilder: (_, index) {
          return Card(
              color: Colors.grey[100],
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: ListTile(
                title: Text(
                  appData.cartList[index].name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    'R\$ ' + appData.cartList[index].price.toString(),
                    style: const TextStyle(fontSize: 14)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('R\$  ', style: TextStyle(fontSize: 16)),
                    SizedBox(
                      width: 50,
                      height: 35,
                      child: TextFormField(
                        initialValue:
                            '${appData.cartList[index].quantity * appData.cartList[index].price}',
                        textAlign: TextAlign.center,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.do_not_disturb_on,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 35,
                      height: 30,
                      child: TextFormField(
                        initialValue: ' ${appData.cartList[index].quantity}',
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          // hintText: '0',
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
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
    );
  }
}
